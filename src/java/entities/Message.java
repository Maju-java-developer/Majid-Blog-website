package entities;

public class Message {
    
    private String content, type, cssStyle;
    public Message(String content, String type, String cssStyle) {
        this.content = content;
        this.type = type;
        this.cssStyle = cssStyle;
    }

    public Message() {
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssStyle() {
        return cssStyle;
    }

    public void setCssStyle(String cssStyle) {
        this.cssStyle = cssStyle;
    }
}
