package semi.store;
import java.util.*;

public class StoreDTO {

   private int store_idx;
   private String store_type;
   private String store_name;
   private String store_addr;
   private String store_addr2;
   private String store_phone;
   private String open_time;
   private String close_time;
   private int lowest_price;
   private int review_num; 
   private int sale_num;
   private int score_num; 
   private String store_image;
   
   public StoreDTO() {}
   
   /*전체를 포함한 생성자*/
   public StoreDTO(int store_idx, String store_type, String store_name, String store_addr, String store_addr2, String store_phone, String open_time, String close_time, int lowest_price, int review_num, int sale_num, int score_num, String store_image) {
      super();
      this.store_idx = store_idx;
      this.store_type = store_type;
      this.store_name = store_name;
      this.store_addr = store_addr;
      this.store_addr2 = store_addr2;
      this.store_phone = store_phone;
      this.open_time = open_time;
      this.close_time = close_time;
      this.review_num = review_num;
      this.sale_num = sale_num;
      this.score_num = score_num;
      this.store_image = store_image;
   }

   public int getStore_idx() {
      return store_idx;
   }

   public void setStore_idx(int store_idx) {
      this.store_idx = store_idx;
   }

   public String getStore_type() {
      return store_type;
   }

   public void setStore_type(String store_type) {
      this.store_type = store_type;
   }

   public String getStore_name() {
      return store_name;
   }

   public void setStore_name(String store_name) {
      this.store_name = store_name;
   }

   public String getStore_addr() {
      return store_addr;
   }

   public void setStore_addr(String store_addr) {
      this.store_addr = store_addr;
   }

   public String getStore_phone() {
      return store_phone;
   }

   public void setStore_phone(String store_phone) {
      this.store_phone = store_phone;
   }



   public String getStore_addr2() {
      return store_addr2;
   }

   public void setStore_addr2(String store_addr2) {
      this.store_addr2 = store_addr2;
   }

   public String getOpen_time() {
      return open_time;
   }

   public void setOpen_time(String open_time) {
      this.open_time = open_time;
   }

   public String getClose_time() {
      return close_time;
   }

   public void setClose_time(String close_time) {
      this.close_time = close_time;
   }

   public String getStore_image() {
      return store_image;
   }

   public void setStore_image(String store_image) {
      this.store_image = store_image;
   }

   public int getLowest_price() {
      return lowest_price;
   }

   public void setLowest_price(int lowest_price) {
      this.lowest_price = lowest_price;
   }

   public int getReview_num() {
      return review_num;
   }

   public void setReview_num(int review_num) {
      this.review_num = review_num;
   }

   public int getSale_num() {
      return sale_num;
   }

   public void setSale_num(int sale_num) {
      this.sale_num = sale_num;
   }

   public int getScore_num() {
      return score_num;
   }

   public void setScore_num(int score_num) {
      this.score_num = score_num;
   }   
   
}

/* create table store (
store_idx number(4) primary key,
store_type varchar2(20), 
store_name varchar2(40),
store_addr varchar2(40), 
store_addr2 varchar2(100), 
store_phone varchar2(20),
open_time varchar2(20),
close_time varchar2(20),
lowest_price number(10), 
review_num number(5), 
sale_num number(5), 
score_num number(5),
store_image varchar2(100)
)

create sequence store_store_idx
minvalue 0 start with 1;


insert into store values(21, 'chicken', 'abc', '서울시 중랑구 묵동', '299-1', '555-5555', 'am0900', 'pm1130', 15000, 0, 0, 3, '')
insert into store values(2, 'chicken', 'bbq', '서울시 중랑구 묵동', '299-1', '555-5555','am1230', 'pm1000', 15000, 0, 0, 3, '')
insert into store values(3, 'chicken', 'bhc', '서울시 중랑구 묵동','299-1', '555-5555', 'am1230', 'pm1000', 15000, 0, 0, 3, '')
insert into store values(4, 'chicken', 'gubne', '서울시 중랑구 묵동', '299-1', '555-5555', 'am0900', 'pm1130', 15000, 0, 0, 3, '')
insert into store values(5, 'chicken', 'hosigi', '서울시 중랑구 묵동', '299-1', '555-5555', 'am1230', 'pm1000', 15000, 0, 0, 3, '')
insert into store values(6, 'chicken', 'kfc', '서울시 중랑구 묵동', '299-1', '555-5555', 'am1230', 'pm1000', 15000, 0, 0, 3, '')
insert into store values(7, 'chicken', 'kyochon', '서울시 중랑구 중화동', '299-1', '555-5555', 'am1230', 'pm1000', 15000, 0, 0, 3, '')
insert into store values(8, 'chicken', 'mexicana', '서울시 중랑구 중화동', '299-1', '555-5555', 'am1230', 'pm1000', 15000, 0, 0, 3, '')
insert into store values(9, 'chicken', 'nene', '서울시 중랑구 묵동', '299-1', '555-5555', 'am0900', 'pm1130', 15000, 0, 0, 3, '')
insert into store values(10, 'chicken', 'pericana','서울시 중랑구 묵동', '299-1', '555-5555', 'am0900', 'pm1130', 15000, 0, 0, 3, '')
insert into store values(11, 'chicken', 'popeyes', '서울시 중랑구 묵동', '299-1', '555-5555', 'am1230', 'pm1000', 15000, 0, 0, 3, '')

*/