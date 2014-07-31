package hply.service;

import hply.domain.SysAuthorization;
import hply.domain.SysResource;
import hply.domain.TreeNode;
import hply.mapper.SysAuthorizationMapper;
import hply.mapper.SysResourceMapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysResourceService {

	@Autowired
	private SysResourceMapper mapper;

	@Autowired
	private SysAuthorizationMapper authMapper;

	public void insert(SysResource sysResource) {
		mapper.insert(sysResource);
	}

	public void update(SysResource sysResource) {
		mapper.update(sysResource);
	}

	public void delete(String id) {
		mapper.delete(id);
	}

	public SysResource get(String id) {
		return mapper.get(id);
	}

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
	public static final String TYPE_SUBMENU = "submenu";

	public TreeNode getRootTreeNode(String userId) {
		TreeNode root = new TreeNode();
		root.setId(ROOT_PARENT_ID);
		List<SysAuthorization> auth = authMapper.getAuthorizationByUserId(userId);
		getTreeNodeList(auth, userId, root);
		return root;
	}

	public TreeNode getMenuRoot(String userId) {
		TreeNode root = getRootTreeNode(userId).getChildren().get(0);
		filterNode(root);
		return root;
	}

	private void filterNode(TreeNode root) {
		List<TreeNode> children = root.getChildren();
		for (int i = 0; i < children.size();) {
			TreeNode node = children.get(i);
			if (node.isSelected() && node.getType().equals("navigation")) {
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

	public List<TreeNode> getTreeNodeList(List<SysAuthorization> auth, String userId, TreeNode root) {
		List<SysResource> listR = this.getChildren(root.getId());
		List<TreeNode> listT = new ArrayList<TreeNode>();
		root.setChildren(listT);

		for (SysResource r : listR) {
			TreeNode node = new TreeNode();

			node.setId(r.getId());
			node.setTitle(r.getResName());
			node.setKey(r.getId());
			node.setIcon(r.getIcon());
			node.setUrl(r.getResUrl());
			node.setExpanded(true);
			node.setType(r.getResType());

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
