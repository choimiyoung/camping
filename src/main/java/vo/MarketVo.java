package vo;

public class MarketVo {

	int 	market_idx;
	int 	category_idx;
	int 	mem_idx;
	String	mem_nickname;
	String  market_title;
	String 	market_content;
	String 	market_regdate;
	int		market_hit_count;

	int 	market_like_count;
	String	market_thumbnail;
	String 	market_ip;
	String 	market_buy_sell;	
	
	int 	    carpool_no;
	
	int			cnt;
	int			heart_flag;

	int 	    market_no;
	
	public String getMem_nickname() {
		return mem_nickname;
	}
	
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getHeart_flag() {
		return heart_flag;
	}

	public void setHeart_flag(int heart_flag) {
		this.heart_flag = heart_flag;
	}

	public int getMarket_idx() {
		return market_idx;
	}

	public void setMarket_idx(int market_idx) {
		this.market_idx = market_idx;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}

	public String getMarket_title() {
		return market_title;
	}

	public void setMarket_title(String market_title) {
		this.market_title = market_title;
	}

	public String getMarket_content() {
		return market_content;
	}

	public void setMarket_content(String market_content) {
		this.market_content = market_content;
	}

	public String getMarket_regdate() {
		return market_regdate;
	}

	public void setMarket_regdate(String market_regdate) {
		this.market_regdate = market_regdate;
	}

	public int getMarket_hit_count() {
		return market_hit_count;
	}

	public void setMarket_hit_count(int market_hit_count) {
		this.market_hit_count = market_hit_count;
	}

	public int getMarket_like_count() {
		return market_like_count;
	}

	public void setMarket_like_count(int market_like_count) {
		this.market_like_count = market_like_count;
	}

	public String getMarket_thumbnail() {
		return market_thumbnail;
	}

	public void setMarket_thumbnail(String market_thumbnail) {
		this.market_thumbnail = market_thumbnail;
	}

	public String getMarket_ip() {
		return market_ip;
	}

	public void setMarket_ip(String market_ip) {
		this.market_ip = market_ip;
	}

	public String getMarket_buy_sell() {
		return market_buy_sell;
	}

	public void setMarket_buy_sell(String market_buy_sell) {
		this.market_buy_sell = market_buy_sell;
	}

	public int getCarpool_no() {
		return carpool_no;
	}

	public void setCarpool_no(int carpool_no) {
		this.carpool_no = carpool_no;
	}
	

	public int getMarket_no() {
		return market_no;
	}

	public void setMarket_no(int market_no) {
		this.market_no = market_no;
	}
	
}