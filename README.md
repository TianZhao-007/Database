# Relational Database notes(Postgre SQL)

## 1.Introduction to Database Systems

## 2.Relational Data Model and SQL

## 3.Entity-Relationship Model
### 3.1 Database design
  #### There are four steps to design database:  
  ###### step 1 : requirements collection and analysis  
     目的： 收集和分析数据需求，以满足商业组织的需要  
     包括： 对数据的描述、使用， 数据收集和使用的细节， 数据库将来可能的新需求...  
  ###### step 2 : Conceptual design  
     目的： 数据概念设计  
     内容： 在高层次抽象出数据； 数据充分的简单，经常用图表表示； 用于和非技术人员交流数据需求  
     （* in this blog, the conceptual design is  based on the entity-relationship model）  
  ###### step 3 : Logical design  
      目的： 建立逻辑数据模型（e.g relational or object-oriented）  
      内容： 从概念层到逻辑层， 还可以进一步提炼（e.g. Normalisation:规范（BCNF,3NF,etc））  
      举例： **From**  ER model **to** relations with their primary and foreign keys,thus facilitating SQL to deal with retrieving, updating and deletion  
      （* in this blog, the logical design is  based on the relational model）  
  ###### step 4 : physical design  
      目的： 把逻辑层次转换成具体的数据管理系统（DBMS）  
      举例： 假设逻辑数据是关系数据模型，在DBMS中建立关系的步骤：选择存储关系的文件； 决定用什么索引来加速访问； 描述完整性约束（integrity constraints）和安全措施（security     measures）  
      影响： 这一步的设计会影响数据库的性能和访问能力。  
       ![imange](http://github.com/Tian_Zhao-/Database/raw/master/note_picture/img.png)
      
  
  

## 4.Functional Dependencies

## 5.Normalisation
