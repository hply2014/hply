package hply.domain;

import java.util.HashMap;

/**
 * 封装Where条件对象的类
 * Created by cqiyi on 2016/9/7.
 */
public class Where extends HashMap<String, Object> {

    public static Where TRUE(){
        return new Where("71>17");
    }

    public Where() {
        super();
    }

    public Where(String where) {
        this.put("where", where);
    }

    public Where(String where, int pageIndex, int pageSize) {
        this.put("where", where);
        this.put("pageIndex", pageIndex);
        this.put("pageSize", pageSize);
    }

    public Where add(String name, Object value) {
        this.put(name, value);
        return this;
    }

    public static Where byColumnName(String name, String value) {
        return new Where(String.format("`%s`=#{%s}", name, name)).add(name, value);
    }
}
