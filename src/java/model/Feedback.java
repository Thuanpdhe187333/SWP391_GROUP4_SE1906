package model;

import java.util.Date;

public class Feedback {
    private int feedbackId;
    private int userId;
    private int productId;
    private String content;
    private Date createdAt;

    public Feedback() {}

    public Feedback(int feedbackId, int userId, int productId, String content, Date createdAt) {
        this.feedbackId = feedbackId;
        this.userId = userId;
        this.productId = productId;
        this.content = content;
        this.createdAt = createdAt;
    }

    // Getters & Setters
    public int getFeedbackId() { return feedbackId; }
    public void setFeedbackId(int feedbackId) { this.feedbackId = feedbackId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}
