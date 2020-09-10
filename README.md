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
      举例： From  ER model to relations with their primary and foreign keys,满足SQL的增删查改等
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
   #### From ER to relations  
   steps: requirements->ER model(conceptual level)->relational database schema(logical level)->relational DBMS(physcial level)  
   ER模型是主观的，一个scenario下可能有多中ER models.  
   约束在设计数据库时很有作用，但是：  
   （1）不是所有约束都可以在ER中描述；  
   （2）不是所有在ER中的约束都可以被翻译到关系中；  
   ##### ER to relations algorithms  
    (1) mapping of regualar entity type  
    PK: the key attributes of E(entity)  
    e.g. Department(name,address) with PK:{name}  
    (2) mapping of weak entity type  
    PK: the partial key attributes of Ew plus the PK of its identifying entity type  
    FK: refereces the PK of its identifying entity type  
    (3) mapping of binary 1:1 relationship types  
    There are three cases: foreign key approach; merged relation approach; Cross-reference approach
    (4) mapping of binary 1:N relationship types  
    (5) mapping of binary M:N relationship types  
    (6) mapping of multi-valued attributes  
    (7) mapping of N-ary realtionship types  
    (8) mapping of superclass/subclass  
    
      

## 4.Functional Dependencies

### Database design quaility  
    (1) completeness 完整性: Does all information has been captured?   
    (2) redundancy freeness 冗余度:Has inforamtion doubled?(if possible)  
    (3) consistent understanding 意义一致性:Does the meaning is consistenet? Does the meaning of NULL is clear?  
    (4) performance 性能:Given tasks,how about its performance?  
### Issues with design database  
    (1) data inconsistency (e.g.the same people have two DoBs)  
    (2) data redundancy(e.g. one person occurs two times)  
    (3) update anomalies（更新异常）  
    We should avoid these problems when we design database.  
### Functional dependencies  
   函数依赖FD就是说，在一个关系内，一些属性的值决定另一些属性的值。
   举个很简单的例子，关系R{animal，legs}   
   我们说animal这个属性决定legs这个属性。  
   这个性质叫做 animal functionally determines legs.  
   {animal} -> {legs}, animal 叫做 determinant， legs 叫做 dependent.  
   （e.g. X -> Y，如果X 确定了，那么Y 一定是同一个值。）
   
    Aim: People want to analysis database design quality in a formal way(FDs).  
    Def： A FD on R is an expression X -> Y with attributes sets X,Y belongs to R.
    FDs tell us the relationship between and among attributes.  
    Top-down method: Start with a relation schema and FDs and produce smaller relaiton schemas.  
    
  Trival FD: 平凡函数依赖
  这个概念就是说，如果有X -> Y, 总是满足Y是X的子集，那就是平凡函数依赖；  
  反正，如果有X -> Y, 总是满足Y不是X的子集，那就是非平凡（non-trival）函数依赖  
  
      Trivial − If a functional dependency (FD) X → Y holds, where Y is a subset of X, then it is called a trivial FD.   
      Trivial FDs always hold. Non-trivial − If an FD X → Y holds, where Y is not a subset of X, then it is called a non-trivial FD.  
      
   ![image](https://github.com/TianZhao-007/Database/blob/master/note_picture/FD.png)    
 ### How to identify FDs in general? （two ways） 
   (1) 分析数据需求  
   比如，我们要设计一个关系 Employee = {ID,name,department,...}  
   其中某个需求是：一个员工名字必须要和他的工号一一对应，因此，我们有{ID} -> {name}  
   (2) 分析样本数据  
   就是给定了我们的数据集，让我们来造一个数据库。  
   
 ### Finding keys  
   superkey: 如果一个关系属性的子集可以被这个关系唯一识别；  
   candidate key: 如果一个superkey，它的真子集都不是superkey；  
   primary key: 从candidate keys中选定一个作为主键。  
   
   Q1: 我们的问题就是给定了一个关系R中的**所有函数依赖FD**，怎么去寻找candidate keys?  
   Q2: 给定部分函数依赖，怎么去找到所有的函数依赖？（**隐式函数依赖**）   
   
![image](https://github.com/TianZhao-007/Database/blob/master/note_picture/implied_FD.jpg)   

   **等价的函数依赖**
![image](https://github.com/TianZhao-007/Database/blob/master/note_picture/equal_FD.png)    
![image](https://github.com/TianZhao-007/Database/blob/master/note_picture/equal_FD_1.png)    





## 5.Normalisation
