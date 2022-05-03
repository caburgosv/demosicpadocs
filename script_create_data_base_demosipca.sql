/*==============================================================*/
/* Table: SIPCATDEPARTMENTS                                     */
/*==============================================================*/

create table SIPCATDEPARTMENTS (
   ID                   SERIAL                 not null,
   CREATED_BY           VARCHAR(50)          null,
   CREATED_DATE         TIMESTAMP            null,
   MODIFIED_BY          VARCHAR(50)          null,
   MODIFIED_DATE        TIMESTAMP            null,
   STATUS               CHAR                 null,
   DESCRIPTION          VARCHAR(255)         null,
   NAME                 VARCHAR(100)         null,
   PHONE                VARCHAR(20)          null,
   ID_ENTERPRISE        INT2                 null
);

alter table SIPCATDEPARTMENTS
   add constraint PK_SIPCATDEPARTMENTS primary key (ID);

/*==============================================================*/
/* Table: SIPCATDEPARTMENTSEMPLOYEES                            */
/*==============================================================*/

create table SIPCATDEPARTMENTSEMPLOYEES (
   ID                   SERIAL                 not null,
   CREATED_BY           VARCHAR(50)          null,
   CREATED_DATE         TIMESTAMP            null,
   MODIFIED_BY          VARCHAR(50)          null,
   MODIFIED_DATE        TIMESTAMP            null,
   STATUS               CHAR                 null,
   ID_DEPARTMENT        INT2                 null,
   ID_EMPLOYEE          INT2                 null
);

alter table SIPCATDEPARTMENTSEMPLOYEES
   add constraint PK_SIPCATDEPARTMENTSEMPLOYEES primary key (ID);

/*==============================================================*/
/* Table: SIPCATEMPLOYEES                                       */
/*==============================================================*/
  
create table SIPCATEMPLOYEES (
   ID                   SERIAL not null,
   CREATED_BY           VARCHAR(50)          null,
   CREATED_DATE         TIMESTAMP            null,
   MODIFIED_BY          VARCHAR(50)          null,
   MODIFIED_DATE        TIMESTAMP            null,
   STATUS               CHAR                 null,
   AGE                  INT2                 null,
   EMAIL                VARCHAR(255)         null,
   NAME                 VARCHAR(100)         null,
   SURNAME              VARCHAR(100)         null,
   "POSITION"           VARCHAR(100)         null
);

alter table SIPCATEMPLOYEES
   add constraint PK_SIPCATEMPLOYEES primary key (ID);

/*==============================================================*/
/* Table: SIPCATENTERPRISES                                     */
/*==============================================================*/
drop table SIPCATENTERPRISES;
  create table SIPCATENTERPRISES (
   ID                   SERIAL not null,
   CREATED_BY           VARCHAR(50)          null,
   CREATED_DATE         TIMESTAMP            null,
   MODIFIED_BY          VARCHAR(50)          null,
   MODIFIED_DATE        TIMESTAMP            null,
   STATUS               CHAR                 null,
   ADDRESS              VARCHAR(255)         null,
   NAME                 VARCHAR(100)         null,
   PHONE                VARCHAR(20)          null
);

alter table SIPCATENTERPRISES
   add constraint PK_SIPCATENTERPRISES primary key (ID);

alter table SIPCATDEPARTMENTS
   add constraint FK_SIPCATDE_REFERENCE_SIPCATEN foreign key (ID_ENTERPRISE)
      references SIPCATENTERPRISES (ID)
      on delete restrict on update restrict;

alter table SIPCATDEPARTMENTSEMPLOYEES
   add constraint FK_SIPCATDE_REFERENCE_SIPCATDE foreign key (ID_DEPARTMENT)
      references SIPCATDEPARTMENTS (ID)
      on delete restrict on update restrict;

alter table SIPCATDEPARTMENTSEMPLOYEES
   add constraint FK_SIPCATDE_REFERENCE_SIPCATEM foreign key (ID_EMPLOYEE)
      references SIPCATEMPLOYEES (ID)
      on delete restrict on update restrict;
     


INSERT INTO public.sipcatenterprises
(created_by, created_date, modified_by, modified_date, status, address, "name", phone)
VALUES('user001', current_timestamp, null, null, '1', 'Quito', 'Unilever Andina Ecuador S.A.', '023015608');

INSERT INTO public.sipcatenterprises
(created_by, created_date, modified_by, modified_date, status, address, "name", phone)
VALUES('user001', current_timestamp, null, null, '1', 'Quito', 'Comercial Kywi S.A.', '023016609');

INSERT INTO public.sipcatenterprises
(created_by, created_date, modified_by, modified_date, status, address, "name", phone)
VALUES('user001', current_timestamp, null, null, '1', 'Quito', 'Industrial Danec S.A.', '023017610');

INSERT INTO public.sipcatenterprises
(created_by, created_date, modified_by, modified_date, status, address, "name", phone)
VALUES('user001', current_timestamp, null, null, '1', 'Quito', 'Andes Petroleum Ecuador Ltd.', '023018611');



INSERT INTO public.sipcatdepartments
(created_by, created_date, modified_by, modified_date, status, description, "name", phone, id_enterprise)
VALUES('user001', current_timestamp, null, null, '1', 'Deparamento de operaciones', 'Operaciones', '0223017805', 1),
('user001', current_timestamp, null, null, '1', 'Deparamento Técnico', 'Técnico', '0223017806', 1),
('user001', current_timestamp, null, null, '1', 'Deparamento RRHH', 'Recursos Humanos', '0223017807', 1);



INSERT INTO public.sipcatemployees
(created_by, created_date, modified_by, modified_date, status, age, email, "name", surname, positionn)
VALUES('user001', current_timestamp, null, null, '1', 32, 'caburgos@outlook.com', 'Carlos', 'Burgos', 'Consultor Técnico'),
('user001', current_timestamp, null, null, '1', 35, 'vaburgos@outlook.com', 'Verónica', 'Burgos', 'Analista Operacional RRHH'),
('user001', current_timestamp, null, null, '1', 26, 'bburgos@outlook.com', 'Verónica', 'Burgos', 'Analista Operaciones');



INSERT INTO public.sipcatdepartmentsemployees
(created_by, created_date, modified_by, modified_date, status, id_department, id_employee)
VALUES('user001', current_timestamp, null, null, '1', 1, 1),
('user001', current_timestamp, null, null, '1', 2, 2),
('user001', current_timestamp, null, null, '1', 3, 3);

select * from SIPCATENTERPRISES;
select * from sipcatdepartments;
select * from sipcatemployees;
select * from sipcatdepartmentsemployees;
