package com.atguigu.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

//通过session实现方法
public class Cart {
    /*
    购物车对象
     */
    /*private Integer totalCount;*/
    /*private BigDecimal totalPrice;*/
    /*private List<CartItem> items=new ArrayList<CartItem>();*/
    /*
    key是商品编号
    value是信息
     */
    private Map<Integer,CartItem> items=new LinkedHashMap<Integer, CartItem>();


    /**
     * 添加商品项
     * @return
     */
    public void addItem(CartItem cartItem){
    //查看购物车是否有该商品
       CartItem item= items.get(cartItem.getId());
       if (item==null){
           //没添加过
           items.put(cartItem.getId(),cartItem);
       }else {
           //已经添加过
           item.setCount((item.getCount()+1));
           item.setTotalPrice(item.getPrice().multiply(new BigDecimal(item.getCount())));
       }
    }

    /**
     * 删除商品项
     * @return
     */
    public void deleteItem(Integer id){
        items.remove(id);
    }

    /**
     * 清空购物车
     * @return
     */
    public void clear(){
        items.clear();
    }

    /**
     * 修改商品数量
     * @return
     */
    public void updateCount(Integer id,Integer count){
        //有商品修改数量，金额
        CartItem cartItem=items.get(id);
        if (cartItem!=null){
            cartItem.setCount(count);
            cartItem.setTotalPrice(cartItem.getPrice().multiply(new BigDecimal(cartItem.getCount())));
        }
    }


    public Integer getTotalCount() {
       Integer totalCount=0;
       //entryset键值对
       for (Map.Entry<Integer,CartItem>entry:items.entrySet()){
         totalCount+= entry.getValue().getCount();
       }
       return totalCount;
    }

    public BigDecimal getTotalPrice() {
        BigDecimal totalPrice=new BigDecimal(0);
        for (Map.Entry<Integer,CartItem>entry:items.entrySet()){
            totalPrice=totalPrice.add(entry.getValue().getTotalPrice());
        }
        return totalPrice;
    }



    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void setItems(Map<Integer, CartItem> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "totalCount=" + getTotalCount() +
                ", totalPrice=" + getTotalPrice() +
                ", items=" + items +
                '}';
    }
}
