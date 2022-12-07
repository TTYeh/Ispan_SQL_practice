# ispan SQL Class


## 資料庫基本
### 資料庫歷史
ANSI SQL(通用SQL)，在微軟加入變數、流程、函數之下變成T-SQL
其他廠商也有類似ex:oracle有plSQL

SQL Server management studio(SSMS):gui介面連資料庫
- 17版不推薦用

MIS是資訊管理系統(Management Information System)
管理信息系統由決策支持系統（DSS）、工業控制系統（CCS）、辦公自動化系統（OA）以及資料庫、模型庫、方法庫、知識庫和與上級機關及外界交換信息的接口組成。
成本會計(算製造成本)、總帳會計(收多少錢)



### 資料結構: 如何組織、如何存取access
queue:管子 FIFO LILO
stack(堆疊區):桶子FILO、LIFO

storage:RAM vs HDD
小資料系統用fileSystem，大的用資料庫

### 資料data
1.真實世界實體:老師、學生 
2.結構敘述(schema):(學生的重要特徵)學生ID,名子,生日... 
3.實體(Instance):(現有的資料)10503314,Jack,1991/1/1

欄位 attribute = field = column = feature
一筆資料表的資料 = record = row = tuple
一格資料 = cell
table資料表定義比較嚴謹 tabular二維表格定義較鬆(什麼五大天條的不重要)

命名重覆 C# namespace,java package
### 資料模型是什麼? 
1.資料結構:

unicode:外國字集 盡量用
其他字集:big5(資策會), gb, 



#### 定序
![](https://i.imgur.com/7hHBlao.png)

#### 字集

ci(不分大小寫)
AS(全形半形的定序)
utf8mb4_unicode_ci
- MySQL字元編碼集中有兩套UTF-8編碼實現，「utf8」和「utf8mb4」，其中「utf8」是一個字最多占據3位元組空間的編碼實現；而「utf8mb4」則是一個字最多占據4位元組空間的編碼實現，也就是UTF-8的完整實現。

- general ：沒有基於Unicode排序規則，在遇到某些特殊語言或字符是，排序結果可能不是所期望的。unicode：是基于標準的Unicode來排序和比較，能夠在各種語言之間精確排序

- ci (case insensitive)，對非二進製字符串比較不區分大小寫cs (case sensitive)，對非二進製字符串比較以區分大小寫的方式處理bin (binary)，二進製字符串搜索

```
3-1-1位元（Bit）
　　電腦中最基本的儲存單位，一個位元有兩個狀態，可儲存一個0（沒
　　電）或1（有電）。也是傳輸資料的基本單位，同一時間能傳達的位元
　　數越多，則其資料傳輸的速度越快。
3-1-2位元組（Byte）
　　記憶體的容量單位，1byte=8bits=28=256種狀態，故能用來代表英文字
　　母、數字和特殊符號，通常電腦中使用一個位元組（一種狀態）來表示
　　一個字元。也是電腦用來表示資料和儲存資料的基本單位。
3-1-3字組（Word）
　　CPU一次所能處理的位元數，稱為「字組」。字組的長度隨電腦的不同
　　而有所不同。如32位元的IBM pc，其字組的長度為32個位元。亦即1word=32bits
```
  
- 一個中文字2byte, varchar(12)可放6個中文字
- unicode === 前面加個n,nvarchar
- 可以到以下介面看資料庫的資料結構
![](https://i.imgur.com/BDGqPL1.png)


2.整合性限制(個體整合性限制:主鍵唯一鍵，參考整合性限制:資料表之間的限制主鍵外鍵) 
3.MANIPULATION操作(CRUD)

### SQL Server studio介面:
master:
model:
msdb: 資料庫管理
tempdb:從model copy是關機會消失的
mysql兩段式:db.table，orcle:db.schema.table
ex:table前面帶dbo
#### 查詢內建時間函數
![](https://i.imgur.com/RWqGedz.png)
### 匯入資料庫教學(參考readme雲端硬碟連結的檔案)
微軟有範例資料庫匯入pubs,northwind,adbenturework的資料庫
新增(mount)資料庫副檔名 .ndf  .mdf  .idf

1. 進入C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA
2. 貼檔案
3. 開sql server management
4. 資料庫右鍵>附加>加入
5. 分配到的port
![](https://i.imgur.com/kpEAwNU.png)

### SQL Server設定管理員 
- 暫停:其他未登入的不能登
- 重新啟動:設定檔更新
下圖說明:SQL Server Browser先右鍵開啟>服務>已停止改自動，再右鍵開啟
![](https://i.imgur.com/uHbYIW7.png)
下圖說明:具名管道 TCP/IP都打開
![](https://i.imgur.com/2l6XH86.png)
Null值append後還是null

## 操作資料庫
### 建立資料庫

```sql=
-- 建立資料庫 school, DDL create--
create database school;

-- 使用資料庫
use school
-- 建立學生資料表
create table student(
s_id int primary key,
s_name varchar(20),
major varchar(20),
age int
)
-- 新增資料 --
insert into student(s_id,s_name,major,age)
values(1,'jack','cs',10);
insert into student(s_id,s_name,major,age)
values(2,'maria','cs',40);
insert into student(s_id,s_name,major,age)
values(3,'monkey','cs',30);
-- 讀取
select * from student
-- 更新
update student
set age = 100
where s_id = 1
-- 刪除
delete from student
where s_id = 3
-- 修改資料表
alter table student
add tel varchar(12);
-- 刪資料表
drop table student;


```



### 資料庫鍵
- 主鍵(primary Key):唯一且非Null
null 1.尚未給值 2.不知道/不清楚/有錯誤 3.null
ex:空集合:查詢沒半筆資料，不是Null

- 候選鍵(candidate key)
ex:姓名
要複合主鍵才能當主鍵
主鍵所在的:parent table
外鍵所在的:child table
- 唯一鍵
唯一不重覆
- 外鍵(Foreign key):
restricted: (預設)不給動作
Cascades:同步刪除資料
### 介面操作與Help
- 可以右鍵 編輯前兩百筆資料

#### 可以用stored procedure去help找資料格式
```sql=
-- 查詢表單基本資料
sp_help student;
```

### SQL語法筆記
```sql=
-- 填值
-- as叫做逸出字元escape
select '作家' as '都是叫作家的欄位' from Table


-- 另存的永久新表單
select * 
into {另存的永久新表單名稱}
from Table

-- 表格字串合併
select colA + colB as newColName
from Table

-- 分隔識別字  在字串中間的'，第一行會故障不行，第二行才行
-- select 'the publisher's name is' as ' '  from authors;
select 'the publisher"s name is' as ' '  from authors;

-- 分隔識別字 "" []  ex:有空白
create table "some poeple"(c1 int,c2 varchar(10));
```
### sql查詢語法
#### search七大語法
/* Searching Condition: 7種 */
  　-- 1. Comparsion (比較運算)
    -- 2. Range (範圍) between但建議comparion比較快
    -- 3. List (列舉) in(...)
    -- 4. String Matching (字串比對)
    -- 5. Null
    -- 6. Joins
    -- 7. Subquery
ansi時間格式 '1970-01-01'，SQL Server時間between不包含端點，記得select後核對一下。
#### sql時間用法
```sql
  use Northwind;
  select * from orders order by OrderDate asc;
  -- 1. 1997以前有幾張訂單
  select count(*) from orders where OrderDate < '1997-01-01';
  select count(*) from orders where year(OrderDate) < '1997';
  -- 2. 1997有幾位客戶
  select * from orders where OrderDate between '1997-01-01' and '1997-12-31';
  select count(distinct (CustomerId)) from orders where OrderDate between '1997-01-01' and '1997-12-31';
  select count(distinct (CustomerId)) from orders where OrderDate >= '1997-01-01' and OrderDate <= '1997-12-31';

 
```

##### 題目:用in的方式(限有鍵值)與left join比較
 example 2: northwind料庫中找出產品(products)的供應商(suppliers)
              國籍(country)是('Canada','Australia','Germany')
              的產品代號(productid),產品名稱(productname),及供應商代號(supplierid)
              
```sql=
   use Northwind 
   go
   
   select productid,productname,supplierid 
   from products
   where SupplierID in ( 
                        select SupplierID 
                        from suppliers 
                        where Country in ('Canada','Australia','Germany')) 
```
### String Pattern-Matching
   -- 萬用字元說明:
% (萬用字元 - 相符的字元)
[ ] (萬用字元 - 相符的字元)
[^] (萬用字元 - 不相符的字元)
_ (萬用字元 - 符合一個字元)
like 
  1.資料庫定序中(collate)如果包含_CS --> CASE SENSITIVE
  2.資料庫定序中(collate)如果包含_CI --> CASE INSENSITIVE
ex: 'Broker','BROKER','broker' 



### 資料庫效能優化
  - 注意 NOT IN 會降低系統執行效率，儘量少用。
  - 注意 NOT BETWEEN 會降低系統執行效率，儘量少用。
## 其他建議網站連結
這個部落格不錯 有技術文章
https://medium.com/mr-efacani-teatime

建議:到微軟的官網刷教學
https://learn.microsoft.com/zh-tw/sql/t-sql/queries/select-transact-sql?view=sql-server-ver16

T-SQL 30天
https://ithelp.ithome.com.tw/articles/10007971
https://ithelp.ithome.com.tw/articles/10027653











