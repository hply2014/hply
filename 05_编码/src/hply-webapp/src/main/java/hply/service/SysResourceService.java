﻿/**
 * @Template info: 2013/08/16, Chengqiyi.
 * ChengQiyi create in 2014-7-13 15:02:00
 * This class generated by CodeSmith Generator
 */

package hply.service;

import hply.domain.SysResource;
import hply.domain.TreeNode;
import hply.persistence.SysResourceMapper;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service(value = "sysResourceService")
public class SysResourceService {

	@Resource(name = "sysResourceMapper")
	private SysResourceMapper sysResourceMapper;

	private final static String ROOT_PARENT_ID = "root";

	public void insert(SysResource sysResource) {
		sysResourceMapper.insert(sysResource);
	}

	public void update(SysResource sysResource) {
		sysResourceMapper.update(sysResource);

	}

	public void delete(String id) {
		sysResourceMapper.delete(id);
	}

	public SysResource get(String id) {
		return sysResourceMapper.get(id);
	}

	public List<SysResource> getAll() {
		return sysResourceMapper.getAll();
	}

	private int count = 0;

	public TreeNode getTreeRoot(String userId) {
		TreeNode root = new TreeNode();
		root.setId(ROOT_PARENT_ID);
		count = 0;

		getTreeNodeList(userId, root);

		return root;
	}

	public List<SysResource> getChildren(String id) {
		return sysResourceMapper.getChildren(id);
	}

	public List<TreeNode> getTreeNodeList(String userId, TreeNode root) {
		List<SysResource> listR = this.getChildren(root.getId());
		List<TreeNode> listT = new ArrayList<TreeNode>();
		root.setChildren(listT);
		
		for (SysResource r : listR) {
			TreeNode node = new TreeNode();
			
			node.setId(r.getId());
			node.setTitle(r.getResname());
			node.setKey(r.getId());
			node.setIcon(r.getIcon());
			node.setUrl(r.getResurl());
			node.setExpanded(true);
			node.setSelected(false);
			node.setTooltip(r.getDescription());

			node.setParent(root);
			listT.add(node);

			node.setChildren(getTreeNodeList(userId, node));
		}

		return listT;
	}

}
