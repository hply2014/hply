package hply.domain;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.annotate.JsonIgnore;

public class TreeNode {

	private String id;
	private String key;
	private String title;
	private TreeNode parent;
	private List<TreeNode> children;
	private String tooltip;
	private String url;
	private boolean expanded;
	private boolean selected;
	private String icon;
	private String type;
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return StringUtils.trimToEmpty(type);
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIcon() {
		return StringUtils.trimToEmpty(icon);
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getId() {
		return StringUtils.trimToEmpty(id);
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKey() {
		return StringUtils.trimToEmpty(key);
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getTitle() {
		return StringUtils.trimToEmpty(title);
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@JsonIgnore
	public TreeNode getParent() {
		return parent;
	}

	public void setParent(TreeNode parent) {
		this.parent = parent;
	}

	public List<TreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}

	public String getTooltip() {
		return StringUtils.trimToEmpty(tooltip);
	}

	public void setTooltip(String tooltip) {
		this.tooltip = tooltip;
	}

	public String getUrl() {
		return StringUtils.trimToEmpty(url);
	}

	public void setUrl(String uri) {
		this.url = uri;
	}

	public boolean isExpanded() {
		return expanded;
	}

	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}

	public boolean isSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}

}
