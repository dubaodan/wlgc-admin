package itemList;

public class Item {
    private String item_Id;
    private String introduction;
    private String type;
    private String item_Name;
    private int quantity;
    private String img;
    public String getItem_Id()
    {
        return item_Id;
    }
    public void setItem_Id(String item_Id)
    {
        this.item_Id = item_Id;
    }
    public String getIntroduction()
    {
        return introduction;
    }
    public void setIntroduction(String introduction) { this.introduction = introduction; }
    public String getType()
    {
        return type;
    }
    public void setType(String type)
    {
        this.type = type;
    }
    public String getItem_Name()
    {
        return item_Name;
    }
    public void setItem_Name(String item_Name)
    {
        this.item_Name = item_Name;
    }
    public int getQuantity()
    {
        return quantity;
    }
    public void setQuantity(int number)
    {
        this.quantity = quantity;
    }
    public String getImg()
    {
        return img;
    }
    public void setImg(String img)
    {
        this.img = img;
    }

}