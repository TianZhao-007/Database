# Relational Database notes(Postgre SQL)

## 1.Introduction to Database Systems

## 2.Relational Data Model and SQL

## 3.Entity-Relationship Model
  ### 3.1 Database design  
   ![DB deign](https://github.com/TianZhao-007/Database/blob/master/note_picture/database_design.png)
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
      举例： **From**  ER model **to** relations with their primary and foreign keys,满足SQL的增删查改等
      （* in this blog, the logical design is  based on the relational model）  
  ###### step 4 : physical design  
      目的： 把逻辑层次转换成具体的数据管理系统（DBMS）  
      举例： 假设逻辑数据是关系数据模型，在DBMS中建立关系的步骤：  
          选择存储关系的文件； 决定用什么索引来加速访问； 描述完整性约束（integrity constraints）和安全措施
      影响： 这一步的设计会影响数据库的性能和访问能力。   
      
              
  ### 3.2 Entity-Relationship(ER) Model
      In 1976, Peter Chen came up with this idea.  
      Later,ER model became the most popular data model used in conceptual database design.  
   #### 通常，ER数据模型主要有三个方面：  
      （1） 数据结构：   
      在ER模型中，数据被描述成实体（entity）和带属性（attributes）的关系（relationship)  
      （2） 数据完整性：   
      在ER模型中，键（keys）来描述实体/关系类型；   
      参与约束描述（participation/cardinality constraint）关系类型  
      （3）数据操控  
      没有标准的data manipulation和ER 数据模型相关  
   ![compare](https://github.com/TianZhao-007/Database/blob/master/note_picture/compare.jpg)  
   #### ER diagrams
      目的： 描述ER数据模型  
      记号：   
      attributes:用椭圆（ovals）表示；    
      key attributes: 用下划线表示；  
      entity types：用矩形框表示；  
      relationship types：用菱形（diamond）表示；  
      weak entity sets:The double diamonds represent the relationship sets linked to weak entity sets.   
      
      概念：  
      Entities：独立存在的事物，实体  
      relationships： 实体之间的关系  
      attributes： 描述 实体/关系 的特征(e.g.一个员工的工号，名字，薪水就叫做他的属性）  
      比如：复合关系VS简单关系属性；单值VS多值；Null values; ...  
      domains of attributes: 对每个attribute而言，域是关联的，例如一个集合的值是attribute的域  
   #### Entity tpyes and Enitity sets  
       概念：   
       实体类型：定义一类有相同属性的实体  
       实体集合：一个特殊类型实体的全部集合  
   #### Relationship types and relationships sets  
        概念：  
        关系类型： 两个或多个实体类型的联系，可以带有属性（e.g.员工 works-for 公司，这里works-for就是一种关系）  
        关系类型的自由度： 关系中参与的实体个数（e.g. binary，ternary，...nary）  
        关系集合：实体之间所有关系的集合  
   #### ER模型中的键（keys） ：类比关系数据库的键
        superkeys, candidate key, primary key  
        最小数目的superkeys就是candidate key（实体类型）
        对ER模型来说，可能存在多个candidate keys（实体类型）  
        关系类型的primary key是参与到关系的实体类型的主键的组合  
   #### Constraints on relationships  
        (*对二元关系类型而言）  
   **cardinality ratios**: 描述实体可以参与的关系 的最大值  
   ![cardinality_ratios](https://github.com/TianZhao-007/Database/blob/master/note_picture/participation%20radios.png)          
   
   **Participation constraints**: (total,partial)  
        员工 work-for 公司  
   ![Participation_constraints](https://github.com/TianZhao-007/Database/blob/master/note_picture/relationship_constraints.png)  
        Total: 例子，一个员工必须为一个公司工作，但每个公司可能有人可能没人  
        Partial：例子，一个员工可能工作也可能不工作，每个公司可能有人可能没人  
        
   **cardinality limits**  (min,max) 限制关系的个数
   ![limit](https://github.com/TianZhao-007/Database/blob/master/note_picture/participation_limits.png)  
    
   #### weak enitity types   
        弱关系实体类型(双菱形表示）     
        Def： Weak entity sets are the sets that do not have a primary key.    
        Its exitence depends on the existence of an identifying entity type（识别关系）  
        It must have one or more attributes,together with the primary key of the identifying entity type   
        so that this weak entity tpye can be distinguished.   
   ![weak_entity](https://github.com/TianZhao-007/Database/blob/master/note_picture/weak_entity.png)  
  ### Enhanced Entity-relationship(EER) model  
        基本定义：增强型实体关系模型包含ER模型的所有性质  
        特点：  
        subclass/superclass  
        specialisation/generalisation  
        constraints on specialisation/generalisation  
   #### subclass/superclass（子类/父类）  
        Def：subgrouping of entities is subclass    
        (1) Subclass inherits attributes and relationships of superclass.  
        (2) Subclass can have additional attributes and realationships.  
        (3) This type of relationship between subclass and superclass is often called ISA relationship type.  
   #### specialisation/generalisation(具体化/一般化)  
        (1) Specialisation is the process of defining a set of subclass of entity type.(top-down)  
   ![image](https://github.com/TianZhao-007/Database/blob/master/note_picture/specialasition.png)
        (2) Generalisation is the inverse process of specialisation
   ![image](https://github.com/TianZhao-007/Database/blob/master/note_picture/generalisation.png)  
   #### constraints on specialisation and generalisation  
        (1) Disjointness constraints  
        不相交约束：子类的具体化必须不相交（disjoint）  
        如果没有这个约束，那么子类的实体可能会重合（overlap）  
        (2) Completeness constraints  
        Total:Every entity in the superclass must be a member of at least one subcalss  
   ![image](https://github.com/TianZhao-007/Database/blob/master/note_picture/disjointness.png)
        Partial: an entity may not belong to any of the subclasses.  
   ![image](https://github.com/TianZhao-007/Database/blob/master/note_picture/completeness.png)
   #### summary of notations  
   ![image](https://github.com/TianZhao-007/Database/blob/master/note_picture/summary_notation.png)  
       
      

## 4.Functional Dependencies











## 5.Normalisation
