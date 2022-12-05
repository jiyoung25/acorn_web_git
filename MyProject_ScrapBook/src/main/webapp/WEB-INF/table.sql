--사용자(회원) 정보를 저장할 테이블
CREATE TABLE users2(
	id VARCHAR2(100) PRIMARY KEY,
	nickname VARCHAR2(100),
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100), --프로필 이미지 경로를 저장할 칼럼
	regdate DATE
);

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file2(
   num NUMBER PRIMARY KEY,
   writer VARCHAR2(100) NOT NULL, -- nickname
   title VARCHAR2(100) NOT NULL,
   orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
   saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
   fileSize NUMBER NOT NULL, -- 파일의 크기 
   regdate DATE
);

--file num
CREATE SEQUENCE board_file_seq;

-- 카테고리 테이블
CREATE TABLE board_category(
   num VARCHAR2(100) NOT NULL,
   tab_name VARCHAR2(100) NOT NULL,
   tab_sub VARCHAR2(100),
);

-- 게시글을 작성할 테이블
CREATE TABLE board_cafe2(
	num NUMBER PRIMARY KEY,--글번호
	category VARCHAR2(100),
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, -- 글 내용
	viewCount NUMBER, --조회수
	regdate DATE --글 작성일
);

-- 게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_cafe_seq;