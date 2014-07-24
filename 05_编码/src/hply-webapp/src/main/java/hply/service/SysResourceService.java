package hply.service;

import hply.domain.SysResource;
import hply.domain.TreeNode;
import hply.mapper.SysResourceMapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SysResourceService {
    
	@Autowired
    private SysResourceMapper mapper;

	  public void insert(SysResource sysResource){
        mapper.insert(sysResource);
      }
	  
	  public void update(SysResource sysResource){
        mapper.update(sysResource);
      }
	  
	  public void delete(String id){
        mapper.delete(id);
      }
	  
	  public SysResource get(String id){
        return mapper.get(id);
      }
	  
	  public List<SysResource> getAll(){
        return mapper.getAll();
      }
	  
		private final static String ROOT_PARENT_ID = "root";
		

		public TreeNode getTreeRoot(String userId) {
			TreeNode root = new TreeNode();
			root.setId(ROOT_PARENT_ID);

			getTreeNodeList(userId, root);

			return root;
		}

		public List<SysResource> getChildren(String id) {
			return mapper.getChildren(id);
		}

		public List<TreeNode> getTreeNodeList(String userId, TreeNode root) {
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
				node.setSelected(false);
				node.setTooltip(r.getDescription());

				node.setParent(root);
				listT.add(node);

				node.setChildren(getTreeNodeList(userId, node));
			}

			return listT;
		}
}

