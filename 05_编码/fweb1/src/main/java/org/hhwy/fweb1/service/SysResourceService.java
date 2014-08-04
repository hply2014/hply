﻿package org.hhwy.fweb1.service;

import java.util.ArrayList;
import java.util.List;

import org.hhwy.fweb1.core.DataVersionConflictException;
import org.hhwy.fweb1.domain.SysAuthorization;
import org.hhwy.fweb1.domain.SysResource;
import org.hhwy.fweb1.domain.TreeNode;
import org.hhwy.fweb1.mapper.SysAuthorizationMapper;
import org.hhwy.fweb1.mapper.SysResourceMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
/**
 * 系统资源，服务类
 */
public class SysResourceService {
	Logger logger = LoggerFactory.getLogger(SysResourceService.class);

	@Autowired
	private SysResourceMapper mapper;

	@Autowired
	private SysAuthorizationMapper authMapper;

	/**
	 * 系统资源，插入对象
	 */
	public void insert(SysResource sysResource) {
		mapper.insert(sysResource);
	}

	/**
	 * 系统资源，不进行冲突检测的更新
	 */
	public void update(SysResource sysResource) {
		mapper.update(sysResource);
	}

	/**
	 * 系统资源，更新数据前检测冲突，防止并发更新错误。
	 */
	public void updateNoConflict(SysResource sysResource) {
		if (mapper.getVersion(sysResource.getId()) != sysResource.getVersion()) {
			throw new DataVersionConflictException(
					"Data conflict has occurred， t_sys_resource.id="
							+ sysResource.getId());
		}
		mapper.update(sysResource);
	}

	/**
	 * 系统资源，根据主键删除对象
	 */
	public void delete(String id) {
		mapper.delete(id);
	}

	/**
	 * 系统资源，根据主键获取一个对象
	 */
	public SysResource get(String id) {
		return mapper.get(id);
	}

	/**
	 * 系统资源，获取所有对象
	 */
	public List<SysResource> getAll() {
		return mapper.getAll();
	}

	/*
	 * 根据UserID获取所有具有权限的资源清单
	 */
	public List<SysResource> getPermission(String userId) {
		// TODO 根据UserID获取所有具有权限的资源清单
		return mapper.getPermission(userId);
	}

	public static final String ROOT_PARENT_ID = "root";
	public static final String TYPE_NAVIGATION = "navigation";

	public TreeNode getRootTreeNode(String userId) {
		TreeNode root = new TreeNode();
		root.setId(ROOT_PARENT_ID);
		List<SysAuthorization> auth = authMapper
				.getAuthorizationByUserId(userId);
		getTreeNodeList(auth, userId, root);
		return root;
	}

	public TreeNode getMenuRoot(String userId) {
		TreeNode root = getRootTreeNode(userId).getChildren().get(0);
		// TODO 不进行权限过滤
		// filterNode(root);
		return root;
	}

	private void filterNode(TreeNode root) {
		List<TreeNode> children = root.getChildren();
		for (int i = 0; i < children.size();) {
			TreeNode node = children.get(i);
			if (node.isSelected() && TYPE_NAVIGATION.equals(node.getType())) {
				filterNode(node);
				i++;
			} else {
				children.remove(i);
			}
		}
	}

	public List<SysResource> getChildren(String id) {
		return mapper.getChildren(id);
	}

	public List<TreeNode> getTreeNodeList(List<SysAuthorization> auth,
			String userId, TreeNode root) {
		List<SysResource> listR = this.getChildren(root.getId());
		List<TreeNode> listT = new ArrayList<TreeNode>();
		root.setChildren(listT);

		for (SysResource r : listR) {
			TreeNode node = new TreeNode();

			node.setId(r.getId());
			node.setTitle(r.getResourceName());
			node.setKey(r.getId());
			node.setIcon(r.getIcon());
			node.setUrl(r.getResourceUri());
			node.setExpanded(TYPE_NAVIGATION.equals(r.getResourceType()));
			node.setType(r.getResourceType());
			node.setDescription(r.getDescription());

			boolean selected = false;

			for (int i = 0; i < auth.size(); i++) {
				selected = auth.get(i).getResourceId().equals(r.getId());
				if (selected) {
					auth.remove(i);
					break;
				}
			}

			node.setSelected(selected);
			node.setTooltip(r.getDescription());

			node.setParent(root);
			listT.add(node);

			node.setChildren(getTreeNodeList(auth, userId, node));
		}

		return listT;
	}
}
