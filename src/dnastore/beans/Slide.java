package dnastore.beans;

public class Slide {
	private String id;
	private String title;
	private String slideName;
	private String content;
	private byte[] background;
	
	public Slide() {
		
	}

	/**
	 * @param id
	 * @param title
	 * @param slideName
	 * @param content
	 * @param background
	 */
	public Slide(String id, String title, String slideName, String content, byte[] background) {
		super();
		this.id = id;
		this.title = title;
		this.slideName = slideName;
		this.content = content;
		this.background = background;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSlideName() {
		return slideName;
	}

	public void setSlideName(String slideName) {
		this.slideName = slideName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public byte[] getBackground() {
		return background;
	}

	public void setBackground(byte[] background) {
		this.background = background;
	}
	
}
