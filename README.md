- [Relational Database notes](#relational-database-notes)
  * [1.Introduction to Database Systems](#1introduction-to-database-systems)
  * [2.Relational Data Model and SQL](#2relational-data-model-and-sql)
  * [3.Entity-Relationship Model](#3entity-relationship-model)
    + [3.1 Database design](#31-database-design)
      - [There are four steps to design database:](#there-are-four-steps-to-design-database-)
    + [3.2 Entity-Relationship(ER) Model](#32-entity-relationship-er--model)
      - [ER数据模型的三个方面：](#er----------)
      - [ER diagrams](#er-diagrams)
      - [Entity tpyes and Enitity sets](#entity-tpyes-and-enitity-sets)
      - [Relationship types and relationships sets](#relationship-types-and-relationships-sets)
      - [ER模型中的键（keys） ：类比关系数据库的键](#er------keys------------)
      - [Constraints on relationships](#constraints-on-relationships)
      - [weak enitity types](#weak-enitity-types)
    + [3.3 Enhanced Entity-relationship(EER) model](#33-enhanced-entity-relationship-eer--model)
      - [subclass/superclass（子类/父类）](#subclass-superclass-------)
      - [specialisation/generalisation(具体化/一般化)](#specialisation-generalisation---------)
      - [constraints on specialisation and generalisation](#constraints-on-specialisation-and-generalisation)
      - [summary of notations](#summary-of-notations)
      - [From ER to relations](#from-er-to-relations)
  * [4.Functional Dependencies](#4functional-dependencies)
    + [Database design quaility](#database-design-quaility)
    + [Issues with design database](#issues-with-design-database)
    + [Functional dependencies](#functional-dependencies)
    + [How to identify FDs in general? （two ways）](#how-to-identify-fds-in-general---two-ways-)
    + [Finding keys](#finding-keys)
    + [Rules for FD](#rules-for-fd)
    + [closure of attributes](#closure-of-attributes)
    + [minimal cover/set最小依赖集](#minimal-cover-set-----)
  * [5.Normalisation](#5normalisation)
    + [Boyce-Codd Normal form(BCNF/3.5NF)](#boyce-codd-normal-form-bcnf-35nf-)
    + [3NF Decomposition](#3nf-decomposition)
  * [6.Relational Algebra](#6relational-algebra)
    + [6.1 relational operators](#61-relational-operators)
    + [6.2 RA queries](#62-ra-queries)
    + [RA versus SQL](#ra-versus-sql)
  * [7. Query Processing and Optimization](#7-query-processing-and-optimization)
    + [7.1 Query processing](#71-query-processing)
    + [7.2 Query optimisation](#72-query-optimisation)
  * [8. Database security](#8-database-security)
    + [Access control](#access-control)
    + [SQL injection(SQL注入)](#sql-injection-sql---)
    + [Projection techniques](#projection-techniques)
  * [9.Database transactions](#9database-transactions)
    + [9.1 introduction to database transactions](#91-introduction-to-database-transactions)
    + [9.2 ACID Properties](#92-acid-properties)
    + [9.3 Concurrent Transactions](#93-concurrent-transactions)
      - [Concurrency control](#concurrency-control)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>


# Relational Database notes

## 1.Introduction to Database Systems  
  Basic concepts.  

## 2.Relational Data Model and SQL  
  How to use SQL to CRUD?  
  For practice purpose,  I use sqlzoo.com.

## 3.Entity-Relationship Model
  ### 3.1 Database design  
   ![DB deign](https://github.com/TianZhao-007/Database/blob/master/note_picture/database_design.png)
  #### There are four steps to design database:  
  step 1 : requirements collection and analysis  
     目的： 收集和分析数据需求，以满足商业组织的需要  
     包括： 对数据的描述、使用， 数据收集和使用的细节， 数据库将来可能的新需求...  
 step 2 : Conceptual design  
     目的： 数据概念设计  
     内容： 在高层次抽象出数据； 数据充分的简单，经常用图表表示； 用于和非技术人员交流数据需求  
     （* in this blog, the conceptual design is  based on the entity-relationship model）  
 step 3 : Logical design  
      目的： 建立逻辑数据模型（e.g relational or object-oriented）  
      内容： 从概念层到逻辑层， 还可以进一步提炼（e.g. Normalisation:规范（BCNF,3NF,etc））  
      举例： From  ER model to relations with their primary and foreign keys,满足SQL的增删查改等
      （* in this blog, the logical design is  based on the relational model）  
 step 4 : physical design  
      目的： 把逻辑层次转换成具体的数据管理系统（DBMS）  
      举例： 假设逻辑数据是关系数据模型，在DBMS中建立关系的步骤：  
          选择存储关系的文件； 决定用什么索引来加速访问； 描述完整性约束（integrity constraints）和安全措施
      影响： 这一步的设计会影响数据库的性能和访问能力。   
      
              
  ### 3.2 Entity-Relationship(ER) Model
      In 1976, Peter Chen came up with this idea.  
      Later,ER model became the most popular data model used in conceptual database design.  
   #### ER数据模型的三个方面：  
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
  ### 3.3 Enhanced Entity-relationship(EER) model  
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
  
  ER to relations algorithms  
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
   WHY FDs?  
   目的：函数依赖是为了设计出更好的数据库，让每个数据之间约束到位  
   含义：顾名思义，函数依赖是函数关系，y= f(x)就是说一个x值肯定对应一个y，y可能对应多个x值  
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
  Completely nontrivial FD:完全非平凡依赖，说明 X 并 Y  = 空集
  
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

 ###  Rules for FD  
 几个函数依赖的规则：  
 （1）splitting rule 分离律  
 比如： X，Y -> Z，不存在 X -> Z or Y -> Z;  
 但是，如果X -> Y,Z ,那么我们可以说 X -> Y AND X ->Z； 
 分离律是针对**右面**而言的  
 
 （2）combining rule 结合律  
 比如： 如果X -> Z or Y -> Z，那么X，Y -> Z；  
 
 （3）trivial-denpendency rule 平凡依赖律  
 比如： X -> Y, Y是X的子集； 那么 X -> X并Y 以及 X-> X交Y；  
 
 （4） Transitive rule 传递律  
 比如： X ->Y ,Y -> Z, 那么有X -> Z;  
 
 （5） reflexive rule 自反律  
 In the reflexive rule, if Y is a subset of X, then X determines Y.  
 If X ⊇ Y then X  → Y    
 
 （6） augmentation rule 增加律  
 比如： X->Y, 那么XZ -> YZ  
 
 ### closure of attributes  
 Given relation,FDs,set of attributes A  
 Find all B such that A -> B (called closure)  
 A+ = {A1,A2,...An}+  
 Start from {A1,A2,...An      }+   
 repeat until on more change  
 if A -> B and A is in set, add B to set;  
 (e.g. A4-> C, add C into the closure set)  
 
 举个例子： student(ssn, sname, address, hscode, hsname, hscity, GPA, priority)  
 a. ssn -> sname,address,GPA  
 b. GPA -> priority  
 c. hscode -> hsname,hscity  
 比如说，我们要求闭包{hscode,ssn}+  
 （1）结合a用分离律，{hscode,ssn}+ = {hscode,ssn,sname,address,GPA}  
 （2）结合b，{hscode,ssn}+ = {hscode,ssn，sname,address,GPA}  
 （3）结合c, {hscode,ssn}+ = {hscode,ssn，sname,address,GPA,hsname,hscity}  
 我们发现，{hscode,ssn}+能够推出所有的attributes，我们说他是一个key  
 
 闭包理论可以求keys；  
 Is set A a key for R?  
 compute A+, if A+ = all attributes,then A is a key  
 就是计算A的闭包，能推出所有属性，他就是一个key
 Given a set of FDs,how can we find all keys?  
 Consider every subset of attributes,figure out whether they can derive all attributes  
 
 some tricks(技巧）：  
 (FD: X -> Y, determinant -> dependent)  
 * 1. If an attritube never appears in the dependent of any FD,  
 Then it must be part of Key.  
 * 2. If an attribute never appears in the determinant of any FD,  
 then it must not be part of Key.  
 * 3. If a proper subset of X is a key, then X must not be a key.  
 
 
 specifying FDs for a relation  
 S1 and S2 sets of FDs  
 S2 **follow form** S1 if every relation instance satisfying S1 also satirsfies S2  
 就是说S2如果follow from S1的话，那么每一个满足S1的关系实例，也同时满足S2.  
 举个例子，S2：{ssn -> priority}; S1 -> {ssn -> GPA, GPA ->priority}  
 
 How to test A-> B follow from S ?  
 (1) A+ based on S, check if B is in set.  
 (2) Armstrong rules  
  
  ### minimal cover/set最小依赖集  
  A minimal cover of a set of FDs F is a minimal set of functional dependencies Fmin that is equivalent to F.   
  There can be many such minimal covers for a set of functional dependencies F.   
  （1）将F中的所有函数依赖的右边化为单一属性；RHS reduction  
  （2）去掉F中的所有函数依赖左边的冗余属性；LHS reduction  
  （3）去掉F中所有冗余的函数依赖。Redundant FDs  
  If XB -> A, and X -> A is already existing, the B is unecessary.  
  参考方法： <https://www.cnblogs.com/xiaolu266/p/8041073.html>  
  

## 5.Normalisation
   Normal forms: 1NF -> 2NF -> 3NF -> BCNF (test criteria: weak -> strong)  
   Def: decomposing a relation into smaller relations in certain normal form  
   规范化就是把关系分解成更小的特定关系  
   ### Boyce-Codd Normal form(BCNF/3.5NF)  
   Def: a relation schema R is in BCNF if whenever a non-trivial FD X-> A hols in R, then X is a superkey.  
   一个关系R是BCNF的时候，若有非平凡函数依赖（X-> A）存在,那么X一定是superkey.  
   当关系R是BCNF的时候，所有的数据冗余都被移除.  
   Do not represent the same fact twice(within a relation).This doesn't mean a good design.  
   <https://blog.csdn.net/qq_43179428/article/details/105596526?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.edu_weight&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-3.edu_weight>
   
   Algorithm for BCNF-decomposition:分解成更小的关系   
   Determine FDs that violate BCNF  
   For every violating FD X->A, decompose relation into R-X and XA.  
   Repeat until all relations stisify BCNF.    
   例子A ： R（ABCD），ABC->D, D->A, CK: ABC
   because D-A violates BCNF, R1(AD) R2(R-A = ABC)  
   (1) R1(AD), CK: D  
   (2) R2(ABC), no FDs  
   Not dependency preserving  
   
   例子B： R(ABCD) CK:A,  FDs = {A -> B, A -> C, BC->D}  
   We find that BC -> D violates BCNF  
   therefore, R1(BCD) R2(R-D = ABC)  
   (1) R1(BCD) CK: BC  
   (2) R2(ABC)  CK: A  
   Decomposition is completed!  
   
  ### 3NF Decomposition   
   Find all cnadidate keys  
   Find THE MINIMAL set  
   create a relation for every FD in the minimal set  
   create a relation for every candidate key not already included in the relations from the previous step  
   
   
  
##  6.Relational Algebra
   Aim: Relation algebra(RA) is a procedural query language defined in relation model.  
   RA is used for the internal representation and processing of sql queries in relational DBMS,   
    which is a basis of query optimisation techiques.  
   Therefore, to understand how SQL queries are processed and how they can be optimised,   
   we need to understand relational algebra first.  
   
   components: relations + relational operators  
   ### 6.1 relational operators  
   - selection: choose certain **tuples(rows)** -> use /sigma + /phi to show  
   - projection: choose certain **attributes(columns)** -> use /pi -> also /pi avoids duplicates  
   - Renaming: change the names of attributes or relation -> /rho  
   -> To unify schemas for set operators/ self-join  
   - natural join:  
   a) enforce equality on all attributes with same name  
   b) eliminate one copy of duplicate attributes  
   -> join: join two relations with conditions    
   - Union,intersection, difference: set operations on two relations(**having the same relational schema**)  
   - Certersian set and join: combine tuples from multiple relations together  
   -> certersian set may contribute to nonsense tuples, therefore we use join  
 
   ### 6.2 RA queries  
   priorities: high to low{selection projection rename}->{certersian set and join}->{intersection}  
   ->{union difference}  
   query: input(two relations) -> output(one relatin)  
   *different from SQL,RA considers relations as sets,NO duplicate tuples in RA  
   
   ### RA versus SQL  
   SELECT DISTINCT * FROM R WHERE /phi; = slection(RA)  
   SELECT DISTINCT A1,A2,... An FROM R; = projection(RA)  
   SELECT AXXX AS A; = renaming(RA)  
   SELECT * FROM R1 UNION SELECT * FROM R2; = union(RA)  
   SELECT * FROM R1 INTERSECT SELECT * FROM R2; = intersection(RA)   
   SELECT * FROM R1 EXCEPT(WEHRE NOT EXIST) SELECT * FROM R2; = difference(RA)  
   SELECT * FROM R1,R2 = Certesian product  
   SELECT DISTINCT * FROM R1 INNER JOIN R2 ON /phi = join（RA)  
   SELECT DISTINCT * FROM R1 NATURAL JOIN R2 = natural join(RA)  
   ![image](https://miro.medium.com/max/966/0*Mu_d-mJMmaVX-j0P)  
   
   One significant difference between **INNER JOIN and NATURAL JOIN** is the number of columns returned.  
   Natural join avoid the repeated columns.
   <https://stackoverflow.com/questions/8696383/difference-between-natural-join-and-inner-join>   
   
   ## 7. Query Processing and Optimization  
   ### 7.1 Query processing  
   Example:  
   a. SELECT XXX FROM XXX WHERE XXX... (high level language:SQL)  
   || pasrser and translator解析器和翻译器  
   b. pai(xxx)(sigma(age<21) xxx)... (low level language:Relational algebra)  
   || optimiser 优化器 <-statistics about DB data  
   c. Execution plan...(query tree)  
   || Evaluation engine -> code implementing relational operators -> DATABASE  
   d. Query results  
   
   Def concepts:  
   1. parser解释器：检查查询语法  
   validation of table names,attributes,data types,access permisson  
   the query is executable or an error message is generated  
   2. translator翻译器：把query语句翻译成RA表达形式  
   （not necessarily equivalnet due to duplicates）  
   3. query otimiser查询优化器  
   Transform into the best possible exection plan  
    (For a single query, there may have different possible RA expressions.)  
    Specify the implementation of each operator in the execution plan.  
    (There are different possible implementations for a relational algebra operator!)  
    sql语句只指定访问的数据，不是如何访问数据。对于一条SQL语句可能有多种执行方案。  
    查询优化器的使命就是找到一个有效率的execution plan.  
    ->enumerate(枚举） alternative plans  
    ->choose the one with the least estimated cost  
    查询优化是关系DBMS中最重要的任务之一。  
    优秀的DBMS必须有一个好的parser。  
    4. Query trees查询树  
    Each RA expression can be represented as a query tree.  
    leaf node: input relations  
    internal node: intermediate result  
    root node: resulting relation  
    对于每一个查询树，计算自底向上（bottom-Up）  
    -> child nodes must be executed before their parent nodes  
    -> but there can exist multiple mehtods of executing sibling（兄弟）nodes（sequentially/parallel）  
    5. Execution plan执行方案  
    Execution plan consists of an **query tree** with **additional annotation** at each node indicating.  
    (1) the *access* method to use for each table.  
    (2) the *implementation* method for each RA operators(i.e. on-the-fly,nested loop,file scan...)  
    
   Steps details:  
   Query parser and translator:  
   1.check the syntax of SQL queries  
   2.verify that the relations do exist  
   3.transform into relational algerbra expressions  
   Query optimiser:  
   1.transform into the best possible excution plan  
   2.specify the implementation of each operator in the excution plan  
   Evaluation engine:  
   1.Evaluate the query execution plan  
   2.Return the result to the user  
   Learn more sql optimization here:<https://www.geeksforgeeks.org/query-optimization-in-relational-algebra/>  
   
   ### 7.2 Query optimisation  
   Three approaches to do optimisation  
   - semantic（语义） query optimisation  
   *Integrity constraints*（e.g. key constraints,domain constraints） in the relational model may not only be utilized to enforce consistency of database,  
   But may also optimise user queries.  
   Examples:  
   ->SELECT DISTINCT ssn FROM Employee;(ssn is PK)  
   ->we can avoid extra costs for duplicate elimination if the existing constraints tells us  
   that tuples in the result will be unique.  
   
   - rule-based query optimisation基于规则的查询优化  
   idea: apply the most restrictive operation before other operations,reducing the size of intermediate results.  
   e.g. push-down selection; push-down projection; re-ordering joins
   * ensure the equivalance of RA experession  
   
   - cost-based query optimisation基于代价的查询优化  
   limit the number of execution strategies  
   
   ## 8. Database security  
   Treats to database:  
   a) loss of confidentiality:a student is not allowed to view grades of other students  
   b) loss of integrity:students are allowed to see their grades, yet not allowed(obviously) to modify them  
   c) loss of avaliability:a lecturer is allowed to change grades of students.  
   
   ### Access control
   - Discretionary access control:自主访问控制  
   (view,Recursive Revocation,Grant revoke)  
   > GRANT: give priviledge to users  
   GRANT privileges ON object TO users [WITH GRANT OPTION]  
   > REVOKE: take away priviledge from uers  
   REVOKE [GRANT OPTION FOR] privileges ON object FROM users  
   
   - Mandatory access control:强制访问控制  
   Restrict access to objects based on thesensitivity of the information contained  
   in the objects and the formalauthorizationof subjects to accessinformation of such sensitivity.  
   
   - Role-based access control:基于角色的访问控制  
   Role-Based Access Control (RBAC)1Access rights are grouped byroles,  
   and the use of resources is restricted toindividuals assigned to specific roles  
   
   ### SQL injection(SQL注入)  
   InSQL injection attacks, hackers inject a string input through the Webapplication  
   which changes the SQL statement to their advantages.  
   
   ### Projection techniques  
   a) Parameterized queries  
   b) Input validation  
   learn more: <https://www.w3schools.com/sql/sql_injection.asp>   
   
   
   ## 9.Database transactions  
   ### 9.1 introduction to database transactions  
   Def: Database applications often access a databaseby transactions rather than individual operations.  
   Situations:  
   - multiple users may modify and share data at the same time  
   - transaction, system, and media failures may happen from time to time  
   Representation:  
   From a high level perspective: **INSERT SELECT UPDATE DELETE BEGIN COMMIT ABORT**  
   At internal process level: **read write begin commit abort**  
   - read(X): load object X into main memory  
   - wirte(X): modifies in-memory copy of objectX (and writes it to-disklater on)  
   - begin: marks the beginning of a transaction  
   - commit: signals a successful end of the transaction - all changes cansafely be applied to the database permanently  
   - abort: signals the transaction has ended unsuccessfully - undo alloperations of the transaction  
   
   ### 9.2 ACID Properties  
   **Atomicity**:  
   The execution of each transaction is atomic, i.e.,either all operations are completed or not done at all.  
   Only two possibilities: *ALL*(all the operations are operated) *NONE*(none of operations are executed)  
   
   **Consistency**: The states of a database are consistent (w.r.t. defined business rules)before and after each transaction.  
   Aim: preserve theconsistency of the database.  
   
   **Isolation**: Execution results of each transaction should not be affected by other concurrent executing transaction.  
   Isolationrequires that transactions areisolated from one another.  
   
   **Durablity**: Once a transction has been successfully completed, its effect should persist in the database.  
   Durabilityrequires that once the transaction is successfully completed, itschanges to the databasemust be persistent despite failures.  
   The decision is irrevocable: once committed, the transaction cannot revertto abort.Changes are durable.  
   
   ### 9.3 Concurrent Transactions  
   Aim: Executing transactions concurrently willimprove database performance  
   - increase throughput:average number of completed transactions  
   - reduce latency: average time to complete a transaction  
   But the DBMS has to guarantee that the interleaving of transactions does not lead to inconsistencies  
   i.e.,**concurrency control**.  
   
   #### Concurrency control  
   Aim: the concurrency control is designed to deal with these problems:  
   - the lost update problem  
   (write-write conflicts) caused by overwirting  
   
   - The dirty read problem  
   (write-read conflicts)  
   T2 could read a database object A, modified by T1 which hasn't committed. This is a dirty read.  
   
   - The Unrepeatable Read Problem  
   - The Phantom Read Problem  
   Read more here:<https://stackoverflow.com/questions/11043712/what-is-the-difference-between-non-repeatable-read-and-phantom-read>  


   ## 10.NoSQL database  
   ### Introduction to NoSQL database  
   A borad class of non-relational databases that does not use SQL as their query language.  
   

   
   
   
  
   
   
   
   
   
   
   
   
   



