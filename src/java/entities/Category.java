package entities;

public class Category {

    private int cid;
    private String Catname;
    private String CatDesc;
    private String CatPic;

    public Category() {
    }

    public Category(int cid, String Catname, String CatDesc, String CatPic) {
        this.cid = cid;
        this.Catname = Catname;
        this.CatDesc = CatDesc;
        this.CatPic = CatPic;
    }
    
    public Category(String Catname, String CatDesc, String CatPic) {
        this.Catname = Catname;
        this.CatDesc = CatDesc;
        this.CatPic = CatPic;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCatname() {
        return Catname;
    }

    public void setCatname(String Catname) {
        this.Catname = Catname;
    }

    public String getCatDesc() {
        return CatDesc;
    }

    public void setCatDesc(String CatDesc) {
        this.CatDesc = CatDesc;
    }

    public String getCatPic() {
        return CatPic;
    }

    public void setCatPic(String CatPic) {
        this.CatPic = CatPic;
    }
    
    
}
