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
CREATE TABLE board_file(
   num NUMBER PRIMARY KEY,
   writer VARCHAR2(100) NOT NULL, -- nickname
   category VARCHAR2(100) NOT NULL, --board_category -> tab_name
   title VARCHAR2(100) NOT NULL,
   file_comment VARCHAR2(1000),
   orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
   saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
   fileSize NUMBER NOT NULL, -- 파일의 크기 
   regdate DATE
);

CREATE SEQUENCE board_file_seq;

CREATE TABLE board_category(
   num NUMBER NOT NULL,
   tab_name VARCHAR2(100) NOT NULL,
   tab_sub VARCHAR2(100)
);