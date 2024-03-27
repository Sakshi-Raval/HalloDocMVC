PGDMP  :    ;                |            HalloDoc    16.1    16.1    ]           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ^           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            _           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            `           1262    65578    HalloDoc    DATABASE     }   CREATE DATABASE "HalloDoc" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "HalloDoc";
                postgres    false            �            1259    65579    EncounterForm    TABLE     �  CREATE TABLE public."EncounterForm" (
    "EncounterFormId" integer NOT NULL,
    requestid integer,
    "HistoryOfPresentIllnessOrInjury" text,
    "MedicalHistory" text,
    "Medications" text,
    "Allergies" text,
    "Temp" text,
    "HR" text,
    "RR" text,
    "BloodPressureSystolic" text,
    "BloodPressureDiastolic" text,
    "O2" text,
    "Pain" text,
    "Heent" text,
    "CV" text,
    "Chest" text,
    "ABD" text,
    "Extremeties" text,
    "Skin" text,
    "Neuro" text,
    "Other" text,
    "Diagnosis" text,
    "TreatmentPlan" text,
    "MedicationsDispensed" text,
    "Procedures" text,
    "FollowUp" text,
    "AdminId" integer,
    "PhysicianId" integer,
    "IsFinalize" boolean DEFAULT false NOT NULL
);
 #   DROP TABLE public."EncounterForm";
       public         heap    postgres    false            �            1259    65585 !   EncounterForm_EncounterFormId_seq    SEQUENCE     �   CREATE SEQUENCE public."EncounterForm_EncounterFormId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."EncounterForm_EncounterFormId_seq";
       public          postgres    false    215            a           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."EncounterForm_EncounterFormId_seq" OWNED BY public."EncounterForm"."EncounterFormId";
          public          postgres    false    216            �            1259    65586    admin    TABLE     �  CREATE TABLE public.admin (
    adminid integer NOT NULL,
    aspnetuserid character varying(128) NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    address1 character varying(500),
    address2 character varying(500),
    city character varying(100),
    regionid integer,
    zip character varying(10),
    altphone character varying(20),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    roleid integer
);
    DROP TABLE public.admin;
       public         heap    postgres    false            �            1259    65591    admin_adminid_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_adminid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.admin_adminid_seq;
       public          postgres    false    217            b           0    0    admin_adminid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.admin_adminid_seq OWNED BY public.admin.adminid;
          public          postgres    false    218            �            1259    65592    adminregion    TABLE     �   CREATE TABLE public.adminregion (
    adminregionid integer NOT NULL,
    adminid integer NOT NULL,
    regionid integer NOT NULL
);
    DROP TABLE public.adminregion;
       public         heap    postgres    false            �            1259    65595    adminregion_adminregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.adminregion_adminregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.adminregion_adminregionid_seq;
       public          postgres    false    219            c           0    0    adminregion_adminregionid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.adminregion_adminregionid_seq OWNED BY public.adminregion.adminregionid;
          public          postgres    false    220            �            1259    65596    aspnetroles    TABLE     v   CREATE TABLE public.aspnetroles (
    id character varying(128) NOT NULL,
    name character varying(256) NOT NULL
);
    DROP TABLE public.aspnetroles;
       public         heap    postgres    false            �            1259    65599    aspnetuserroles    TABLE     �   CREATE TABLE public.aspnetuserroles (
    userid character varying(128) NOT NULL,
    roleid character varying(128) NOT NULL
);
 #   DROP TABLE public.aspnetuserroles;
       public         heap    postgres    false            �            1259    65602    aspnetusers    TABLE     i  CREATE TABLE public.aspnetusers (
    id character varying(128) NOT NULL,
    username character varying(256) NOT NULL,
    passwordhash character varying,
    email character varying(256),
    phonenumber character varying(20),
    ip character varying(20),
    createddate timestamp without time zone NOT NULL,
    modifieddate timestamp without time zone
);
    DROP TABLE public.aspnetusers;
       public         heap    postgres    false            �            1259    65607    blockrequests    TABLE     m  CREATE TABLE public.blockrequests (
    blockrequestid integer NOT NULL,
    phonenumber character varying(50),
    email character varying(50),
    isactive bit(1),
    reason character varying,
    requestid character varying(50) NOT NULL,
    ip character varying(20),
    createddate timestamp without time zone,
    modifieddate timestamp without time zone
);
 !   DROP TABLE public.blockrequests;
       public         heap    postgres    false            �            1259    65612     blockrequests_blockrequestid_seq    SEQUENCE     �   CREATE SEQUENCE public.blockrequests_blockrequestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.blockrequests_blockrequestid_seq;
       public          postgres    false    224            d           0    0     blockrequests_blockrequestid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.blockrequests_blockrequestid_seq OWNED BY public.blockrequests.blockrequestid;
          public          postgres    false    225            �            1259    65613    business    TABLE     n  CREATE TABLE public.business (
    businessid integer NOT NULL,
    name character varying(100) NOT NULL,
    address1 character varying(500),
    address2 character varying(500),
    city character varying(50),
    regionid integer,
    zipcode character varying(10),
    phonenumber character varying(20),
    faxnumber character varying(20),
    isregistered bit(1),
    createdby character varying(128),
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    ip character varying(20)
);
    DROP TABLE public.business;
       public         heap    postgres    false            �            1259    65618    business_businessid_seq    SEQUENCE     �   CREATE SEQUENCE public.business_businessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.business_businessid_seq;
       public          postgres    false    226            e           0    0    business_businessid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.business_businessid_seq OWNED BY public.business.businessid;
          public          postgres    false    227            �            1259    65619    casetag    TABLE     i   CREATE TABLE public.casetag (
    casetagid integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.casetag;
       public         heap    postgres    false            �            1259    65622 	   concierge    TABLE     �  CREATE TABLE public.concierge (
    conciergeid integer NOT NULL,
    conciergename character varying(100) NOT NULL,
    address character varying(150),
    street character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    zipcode character varying(50) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    regionid integer,
    roleid character varying(20)
);
    DROP TABLE public.concierge;
       public         heap    postgres    false            �            1259    65625    concierge_conciergeid_seq    SEQUENCE     �   CREATE SEQUENCE public.concierge_conciergeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.concierge_conciergeid_seq;
       public          postgres    false    229            f           0    0    concierge_conciergeid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.concierge_conciergeid_seq OWNED BY public.concierge.conciergeid;
          public          postgres    false    230            �            1259    65626    emaillog    TABLE       CREATE TABLE public.emaillog (
    emaillogid numeric(9,0) NOT NULL,
    emailtemplate character varying,
    subjectname character varying(200) NOT NULL,
    emailid character varying(200) NOT NULL,
    confirmationnumber character varying(200),
    filepath character varying,
    roleid integer,
    requestid integer,
    adminid integer,
    physicianid integer,
    createdate timestamp without time zone NOT NULL,
    sentdate timestamp without time zone,
    isemailsent bit(1),
    senttries integer,
    action integer
);
    DROP TABLE public.emaillog;
       public         heap    postgres    false            �            1259    65631    healthprofessionals    TABLE     i  CREATE TABLE public.healthprofessionals (
    vendorid integer NOT NULL,
    vendorname character varying(100) NOT NULL,
    profession integer,
    faxnumber character varying(50) NOT NULL,
    address character varying(150),
    city character varying(100),
    state character varying(50),
    zip character varying(50),
    regionid integer,
    createddate timestamp without time zone NOT NULL,
    modifieddate timestamp without time zone,
    phonenumber character varying(100),
    isdeleted bit(1),
    ip character varying(20),
    email character varying(50),
    businesscontact character varying(100)
);
 '   DROP TABLE public.healthprofessionals;
       public         heap    postgres    false            �            1259    65636     healthprofessionals_vendorid_seq    SEQUENCE     �   CREATE SEQUENCE public.healthprofessionals_vendorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.healthprofessionals_vendorid_seq;
       public          postgres    false    232            g           0    0     healthprofessionals_vendorid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.healthprofessionals_vendorid_seq OWNED BY public.healthprofessionals.vendorid;
          public          postgres    false    233            �            1259    65637    healthprofessionaltype    TABLE     �   CREATE TABLE public.healthprofessionaltype (
    healthprofessionalid integer NOT NULL,
    professionname character varying(50) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    isactive bit(1),
    isdeleted bit(1)
);
 *   DROP TABLE public.healthprofessionaltype;
       public         heap    postgres    false            �            1259    65640 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE     �   CREATE SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq;
       public          postgres    false    234            h           0    0 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq OWNED BY public.healthprofessionaltype.healthprofessionalid;
          public          postgres    false    235            �            1259    65641    menu    TABLE     �   CREATE TABLE public.menu (
    menuid integer NOT NULL,
    name character varying(50) NOT NULL,
    accounttype smallint NOT NULL,
    sortorder integer,
    CONSTRAINT menu_accounttype_check CHECK ((accounttype = ANY (ARRAY[1, 2])))
);
    DROP TABLE public.menu;
       public         heap    postgres    false            �            1259    65645    menu_menuid_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_menuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.menu_menuid_seq;
       public          postgres    false    236            i           0    0    menu_menuid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.menu_menuid_seq OWNED BY public.menu.menuid;
          public          postgres    false    237            �            1259    65646    orderdetails    TABLE     l  CREATE TABLE public.orderdetails (
    id integer NOT NULL,
    vendorid integer,
    requestid integer,
    faxnumber character varying(50),
    email character varying(50),
    businesscontact character varying(100),
    prescription character varying,
    noofrefill integer,
    createddate timestamp without time zone,
    createdby character varying(100)
);
     DROP TABLE public.orderdetails;
       public         heap    postgres    false            �            1259    65651    orderdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orderdetails_id_seq;
       public          postgres    false    238            j           0    0    orderdetails_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orderdetails_id_seq OWNED BY public.orderdetails.id;
          public          postgres    false    239            �            1259    65652 	   physician    TABLE     �  CREATE TABLE public.physician (
    physicianid integer NOT NULL,
    aspnetuserid character varying(128),
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    medicallicense character varying(500),
    photo character varying(100),
    adminnotes character varying(500),
    isagreementdoc bit(1),
    isbackgrounddoc bit(1),
    istrainingdoc bit(1),
    isnondisclosuredoc bit(1),
    address1 character varying(500),
    address2 character varying(500),
    city character varying(100),
    regionid integer,
    zip character varying(10),
    altphone character varying(20),
    createdby character varying(500) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(500),
    modifieddate timestamp without time zone,
    status smallint,
    businessname character varying(100) NOT NULL,
    businesswebsite character varying(200) NOT NULL,
    isdeleted bit(1),
    roleid integer,
    npinumber character varying(500),
    islicensedoc bit(1),
    signature character varying(100),
    iscredentialdoc bit(1),
    istokengenerate bit(1),
    syncemailaddress character varying(50)
);
    DROP TABLE public.physician;
       public         heap    postgres    false            �            1259    65657    physician_physicianid_seq    SEQUENCE     �   CREATE SEQUENCE public.physician_physicianid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.physician_physicianid_seq;
       public          postgres    false    240            k           0    0    physician_physicianid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.physician_physicianid_seq OWNED BY public.physician.physicianid;
          public          postgres    false    241            �            1259    65658    physicianlocation    TABLE       CREATE TABLE public.physicianlocation (
    locationid integer NOT NULL,
    physicianid integer,
    latitude numeric(9,2),
    longitude numeric(9,2),
    createddate timestamp without time zone,
    physicianname character varying(50),
    address character varying(500)
);
 %   DROP TABLE public.physicianlocation;
       public         heap    postgres    false            �            1259    65663    physiciannotification    TABLE     �   CREATE TABLE public.physiciannotification (
    id integer NOT NULL,
    physicianid integer,
    isnotificationstopped bit(1)
);
 )   DROP TABLE public.physiciannotification;
       public         heap    postgres    false            �            1259    65666    physiciannotification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.physiciannotification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.physiciannotification_id_seq;
       public          postgres    false    243            l           0    0    physiciannotification_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.physiciannotification_id_seq OWNED BY public.physiciannotification.id;
          public          postgres    false    244            �            1259    65667    physicianregion    TABLE        CREATE TABLE public.physicianregion (
    physicianregionid integer NOT NULL,
    physicianid integer,
    regionid integer
);
 #   DROP TABLE public.physicianregion;
       public         heap    postgres    false            �            1259    65670 %   physicianregion_physicianregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.physicianregion_physicianregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.physicianregion_physicianregionid_seq;
       public          postgres    false    245            m           0    0 %   physicianregion_physicianregionid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.physicianregion_physicianregionid_seq OWNED BY public.physicianregion.physicianregionid;
          public          postgres    false    246            �            1259    65671    region    TABLE     �   CREATE TABLE public.region (
    regionid integer NOT NULL,
    name character varying(50) NOT NULL,
    abbreviation character varying(50)
);
    DROP TABLE public.region;
       public         heap    postgres    false            �            1259    65674    region_regionid_seq    SEQUENCE     �   CREATE SEQUENCE public.region_regionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.region_regionid_seq;
       public          postgres    false    247            n           0    0    region_regionid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.region_regionid_seq OWNED BY public.region.regionid;
          public          postgres    false    248            �            1259    65675    request    TABLE     �  CREATE TABLE public.request (
    requestid integer NOT NULL,
    requesttypeid integer DEFAULT 1 NOT NULL,
    userid integer,
    firstname character varying(100),
    lastname character varying(100),
    phonenumber character varying(23),
    email character varying(50),
    status smallint NOT NULL,
    physicianid integer,
    confirmationnumber character varying(20),
    createddate date NOT NULL,
    isdeleted bit(1),
    modifieddate timestamp without time zone,
    declinedby character varying(250),
    isurgentemailsent bit(1),
    lastwellnessdate timestamp without time zone,
    ismobile bit(1),
    calltype smallint,
    completedbyphysician bit(1),
    lastreservationdate timestamp without time zone,
    accepteddate timestamp without time zone,
    relationname character varying(100),
    casenumber character varying(50),
    ip character varying(20),
    casetag character varying(50),
    casetagphysician character varying(50),
    patientaccountid character varying(128),
    createduserid integer,
    CONSTRAINT request_requesttypeid_check CHECK ((requesttypeid = ANY (ARRAY[1, 2, 3, 4]))),
    CONSTRAINT request_status_check CHECK (((status >= 1) AND (status <= 15)))
);
    DROP TABLE public.request;
       public         heap    postgres    false            �            1259    65683    request_requestid_seq    SEQUENCE     �   CREATE SEQUENCE public.request_requestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.request_requestid_seq;
       public          postgres    false    249            o           0    0    request_requestid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.request_requestid_seq OWNED BY public.request.requestid;
          public          postgres    false    250            �            1259    65684    requestbusiness    TABLE     �   CREATE TABLE public.requestbusiness (
    requestbusinessid integer NOT NULL,
    requestid integer NOT NULL,
    businessid integer NOT NULL,
    ip character varying(20)
);
 #   DROP TABLE public.requestbusiness;
       public         heap    postgres    false            �            1259    65687 %   requestbusiness_requestbusinessid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestbusiness_requestbusinessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.requestbusiness_requestbusinessid_seq;
       public          postgres    false    251            p           0    0 %   requestbusiness_requestbusinessid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.requestbusiness_requestbusinessid_seq OWNED BY public.requestbusiness.requestbusinessid;
          public          postgres    false    252            �            1259    65688    requestclient    TABLE     �  CREATE TABLE public.requestclient (
    requestclientid integer NOT NULL,
    requestid integer NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    phonenumber character varying(23),
    location character varying(100),
    address character varying(500),
    regionid integer,
    notimobile character varying(20),
    notiemail character varying(50),
    notes character varying(500),
    email character varying(50),
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    ismobile bit(1),
    street character varying(100),
    city character varying(100),
    state character varying(100),
    zipcode character varying(10),
    communicationtype smallint,
    remindreservationcount smallint,
    remindhousecallcount smallint,
    issetfollowupsent smallint,
    ip character varying(20),
    isreservationremindersent smallint,
    latitude numeric(9,2),
    longitude numeric(9,2)
);
 !   DROP TABLE public.requestclient;
       public         heap    postgres    false            �            1259    65693 !   requestclient_requestclientid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestclient_requestclientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.requestclient_requestclientid_seq;
       public          postgres    false    253            q           0    0 !   requestclient_requestclientid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.requestclient_requestclientid_seq OWNED BY public.requestclient.requestclientid;
          public          postgres    false    254            �            1259    65694    requestclosed    TABLE        CREATE TABLE public.requestclosed (
    requestclosedid integer NOT NULL,
    requestid integer NOT NULL,
    requeststatuslogid integer NOT NULL,
    phynotes character varying(500),
    clientnotes character varying(500),
    ip character varying(20)
);
 !   DROP TABLE public.requestclosed;
       public         heap    postgres    false                        1259    65699 !   requestclosed_requestclosedid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestclosed_requestclosedid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.requestclosed_requestclosedid_seq;
       public          postgres    false    255            r           0    0 !   requestclosed_requestclosedid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.requestclosed_requestclosedid_seq OWNED BY public.requestclosed.requestclosedid;
          public          postgres    false    256                       1259    65700    requestconcierge    TABLE     �   CREATE TABLE public.requestconcierge (
    id integer NOT NULL,
    requestid integer NOT NULL,
    conciergeid integer NOT NULL,
    ip character varying(20)
);
 $   DROP TABLE public.requestconcierge;
       public         heap    postgres    false                       1259    65703    requestconcierge_id_seq    SEQUENCE     �   CREATE SEQUENCE public.requestconcierge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.requestconcierge_id_seq;
       public          postgres    false    257            s           0    0    requestconcierge_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.requestconcierge_id_seq OWNED BY public.requestconcierge.id;
          public          postgres    false    258                       1259    65704    requestnotes    TABLE       CREATE TABLE public.requestnotes (
    requestnotesid integer NOT NULL,
    requestid integer NOT NULL,
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    physiciannotes character varying(500),
    adminnotes character varying(500),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    ip character varying(20),
    administrativenotes character varying(500)
);
     DROP TABLE public.requestnotes;
       public         heap    postgres    false                       1259    65709    requestnotes_requestnotesid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestnotes_requestnotesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.requestnotes_requestnotesid_seq;
       public          postgres    false    259            t           0    0    requestnotes_requestnotesid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.requestnotes_requestnotesid_seq OWNED BY public.requestnotes.requestnotesid;
          public          postgres    false    260                       1259    65710    requeststatuslog    TABLE     m  CREATE TABLE public.requeststatuslog (
    requeststatuslogid integer NOT NULL,
    requestid integer NOT NULL,
    status smallint NOT NULL,
    physicianid integer,
    adminid integer,
    transtophysicianid integer,
    notes character varying(500),
    createddate timestamp without time zone NOT NULL,
    ip character varying(20),
    transtoadmin bit(1)
);
 $   DROP TABLE public.requeststatuslog;
       public         heap    postgres    false                       1259    65715 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE     �   CREATE SEQUENCE public.requeststatuslog_requeststatuslogid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.requeststatuslog_requeststatuslogid_seq;
       public          postgres    false    261            u           0    0 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.requeststatuslog_requeststatuslogid_seq OWNED BY public.requeststatuslog.requeststatuslogid;
          public          postgres    false    262                       1259    65716    requesttype    TABLE     q   CREATE TABLE public.requesttype (
    requesttypeid integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.requesttype;
       public         heap    postgres    false                       1259    65719    requesttype_requesttypeid_seq    SEQUENCE     �   CREATE SEQUENCE public.requesttype_requesttypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.requesttype_requesttypeid_seq;
       public          postgres    false    263            v           0    0    requesttype_requesttypeid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.requesttype_requesttypeid_seq OWNED BY public.requesttype.requesttypeid;
          public          postgres    false    264            	           1259    65720    requestwisefile    TABLE     
  CREATE TABLE public.requestwisefile (
    requestwisefileid integer NOT NULL,
    requestid integer NOT NULL,
    filename character varying(500) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    physicianid integer,
    adminid integer,
    doctype smallint,
    isfrontside bit(1),
    iscompensation bit(1),
    ip character varying(20),
    isfinalize bit(1),
    isdeleted bit(1),
    ispatientrecords bit(1),
    CONSTRAINT requestwisefile_doctype_check CHECK ((doctype = ANY (ARRAY[1, 2, 3])))
);
 #   DROP TABLE public.requestwisefile;
       public         heap    postgres    false            
           1259    65726 %   requestwisefile_requestwisefileid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestwisefile_requestwisefileid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.requestwisefile_requestwisefileid_seq;
       public          postgres    false    265            w           0    0 %   requestwisefile_requestwisefileid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.requestwisefile_requestwisefileid_seq OWNED BY public.requestwisefile.requestwisefileid;
          public          postgres    false    266                       1259    65727    role    TABLE     �  CREATE TABLE public.role (
    roleid integer NOT NULL,
    name character varying(50) NOT NULL,
    accounttype smallint NOT NULL,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    isdeleted bit(1) NOT NULL,
    ip character varying(20),
    CONSTRAINT role_accounttype_check CHECK ((accounttype = ANY (ARRAY[1, 2])))
);
    DROP TABLE public.role;
       public         heap    postgres    false                       1259    65731    role_roleid_seq    SEQUENCE     �   CREATE SEQUENCE public.role_roleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.role_roleid_seq;
       public          postgres    false    267            x           0    0    role_roleid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.role_roleid_seq OWNED BY public.role.roleid;
          public          postgres    false    268                       1259    65732    rolemenu    TABLE     j   CREATE TABLE public.rolemenu (
    rolemenuid integer NOT NULL,
    roleid integer,
    menuid integer
);
    DROP TABLE public.rolemenu;
       public         heap    postgres    false                       1259    65735    rolemenu_rolemenuid_seq    SEQUENCE     �   CREATE SEQUENCE public.rolemenu_rolemenuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.rolemenu_rolemenuid_seq;
       public          postgres    false    269            y           0    0    rolemenu_rolemenuid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.rolemenu_rolemenuid_seq OWNED BY public.rolemenu.rolemenuid;
          public          postgres    false    270                       1259    65736    shift    TABLE     O  CREATE TABLE public.shift (
    shiftid integer NOT NULL,
    physicianid integer NOT NULL,
    startdate date NOT NULL,
    isrepeat bit(1) NOT NULL,
    weekdays character(7),
    repeatupto integer,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    ip character varying(20)
);
    DROP TABLE public.shift;
       public         heap    postgres    false                       1259    65739    shift_shiftid_seq    SEQUENCE     �   CREATE SEQUENCE public.shift_shiftid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.shift_shiftid_seq;
       public          postgres    false    271            z           0    0    shift_shiftid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.shift_shiftid_seq OWNED BY public.shift.shiftid;
          public          postgres    false    272                       1259    65740    shiftdetail    TABLE       CREATE TABLE public.shiftdetail (
    shiftdetailid integer NOT NULL,
    shiftid integer NOT NULL,
    shiftdate timestamp without time zone NOT NULL,
    regionid integer,
    starttime time without time zone NOT NULL,
    endtime time without time zone NOT NULL,
    status smallint NOT NULL,
    isdeleted bit(1) NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    lastrunningdate timestamp without time zone,
    eventid character varying(100),
    issync bit(1)
);
    DROP TABLE public.shiftdetail;
       public         heap    postgres    false                       1259    65743    shiftdetail_shiftdetailid_seq    SEQUENCE     �   CREATE SEQUENCE public.shiftdetail_shiftdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.shiftdetail_shiftdetailid_seq;
       public          postgres    false    273            {           0    0    shiftdetail_shiftdetailid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.shiftdetail_shiftdetailid_seq OWNED BY public.shiftdetail.shiftdetailid;
          public          postgres    false    274                       1259    65744    shiftdetailregion    TABLE     �   CREATE TABLE public.shiftdetailregion (
    shiftdetailregionid integer NOT NULL,
    shiftdetailid integer NOT NULL,
    regionid integer NOT NULL,
    isdeleted boolean
);
 %   DROP TABLE public.shiftdetailregion;
       public         heap    postgres    false                       1259    65747 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq;
       public          postgres    false    275            |           0    0 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq OWNED BY public.shiftdetailregion.shiftdetailregionid;
          public          postgres    false    276                       1259    65748    smslog    TABLE     �  CREATE TABLE public.smslog (
    smslogid numeric(9,2) NOT NULL,
    smstemplate character varying,
    mobilenumber character varying(50),
    confirmationnumber character varying(200),
    roleid integer,
    adminid integer,
    requestid integer,
    physicianid integer,
    createdate timestamp without time zone NOT NULL,
    sentdate timestamp without time zone,
    issmssent boolean,
    senttries integer NOT NULL,
    action integer
);
    DROP TABLE public.smslog;
       public         heap    postgres    false                       1259    65753    users    TABLE     +  CREATE TABLE public.users (
    userid integer NOT NULL,
    aspnetuserid character varying(128),
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    ismobile boolean,
    street character varying(100),
    city character varying(100),
    state character varying(100),
    regionid integer,
    zipcode character varying(10),
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted boolean,
    ip character varying(20),
    isrequestwithemail boolean
);
    DROP TABLE public.users;
       public         heap    postgres    false                       1259    65758    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    278            }           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    279            �           2604    65759    EncounterForm EncounterFormId    DEFAULT     �   ALTER TABLE ONLY public."EncounterForm" ALTER COLUMN "EncounterFormId" SET DEFAULT nextval('public."EncounterForm_EncounterFormId_seq"'::regclass);
 P   ALTER TABLE public."EncounterForm" ALTER COLUMN "EncounterFormId" DROP DEFAULT;
       public          postgres    false    216    215            �           2604    65760    admin adminid    DEFAULT     n   ALTER TABLE ONLY public.admin ALTER COLUMN adminid SET DEFAULT nextval('public.admin_adminid_seq'::regclass);
 <   ALTER TABLE public.admin ALTER COLUMN adminid DROP DEFAULT;
       public          postgres    false    218    217            �           2604    65761    adminregion adminregionid    DEFAULT     �   ALTER TABLE ONLY public.adminregion ALTER COLUMN adminregionid SET DEFAULT nextval('public.adminregion_adminregionid_seq'::regclass);
 H   ALTER TABLE public.adminregion ALTER COLUMN adminregionid DROP DEFAULT;
       public          postgres    false    220    219            �           2604    65762    blockrequests blockrequestid    DEFAULT     �   ALTER TABLE ONLY public.blockrequests ALTER COLUMN blockrequestid SET DEFAULT nextval('public.blockrequests_blockrequestid_seq'::regclass);
 K   ALTER TABLE public.blockrequests ALTER COLUMN blockrequestid DROP DEFAULT;
       public          postgres    false    225    224            �           2604    65763    business businessid    DEFAULT     z   ALTER TABLE ONLY public.business ALTER COLUMN businessid SET DEFAULT nextval('public.business_businessid_seq'::regclass);
 B   ALTER TABLE public.business ALTER COLUMN businessid DROP DEFAULT;
       public          postgres    false    227    226            �           2604    65764    concierge conciergeid    DEFAULT     ~   ALTER TABLE ONLY public.concierge ALTER COLUMN conciergeid SET DEFAULT nextval('public.concierge_conciergeid_seq'::regclass);
 D   ALTER TABLE public.concierge ALTER COLUMN conciergeid DROP DEFAULT;
       public          postgres    false    230    229                        2604    65765    healthprofessionals vendorid    DEFAULT     �   ALTER TABLE ONLY public.healthprofessionals ALTER COLUMN vendorid SET DEFAULT nextval('public.healthprofessionals_vendorid_seq'::regclass);
 K   ALTER TABLE public.healthprofessionals ALTER COLUMN vendorid DROP DEFAULT;
       public          postgres    false    233    232                       2604    65766 +   healthprofessionaltype healthprofessionalid    DEFAULT     �   ALTER TABLE ONLY public.healthprofessionaltype ALTER COLUMN healthprofessionalid SET DEFAULT nextval('public.healthprofessionaltype_healthprofessionalid_seq'::regclass);
 Z   ALTER TABLE public.healthprofessionaltype ALTER COLUMN healthprofessionalid DROP DEFAULT;
       public          postgres    false    235    234                       2604    65767    menu menuid    DEFAULT     j   ALTER TABLE ONLY public.menu ALTER COLUMN menuid SET DEFAULT nextval('public.menu_menuid_seq'::regclass);
 :   ALTER TABLE public.menu ALTER COLUMN menuid DROP DEFAULT;
       public          postgres    false    237    236                       2604    65768    orderdetails id    DEFAULT     r   ALTER TABLE ONLY public.orderdetails ALTER COLUMN id SET DEFAULT nextval('public.orderdetails_id_seq'::regclass);
 >   ALTER TABLE public.orderdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238                       2604    65769    physician physicianid    DEFAULT     ~   ALTER TABLE ONLY public.physician ALTER COLUMN physicianid SET DEFAULT nextval('public.physician_physicianid_seq'::regclass);
 D   ALTER TABLE public.physician ALTER COLUMN physicianid DROP DEFAULT;
       public          postgres    false    241    240                       2604    65770    physiciannotification id    DEFAULT     �   ALTER TABLE ONLY public.physiciannotification ALTER COLUMN id SET DEFAULT nextval('public.physiciannotification_id_seq'::regclass);
 G   ALTER TABLE public.physiciannotification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243                       2604    65771 !   physicianregion physicianregionid    DEFAULT     �   ALTER TABLE ONLY public.physicianregion ALTER COLUMN physicianregionid SET DEFAULT nextval('public.physicianregion_physicianregionid_seq'::regclass);
 P   ALTER TABLE public.physicianregion ALTER COLUMN physicianregionid DROP DEFAULT;
       public          postgres    false    246    245                       2604    65772    region regionid    DEFAULT     r   ALTER TABLE ONLY public.region ALTER COLUMN regionid SET DEFAULT nextval('public.region_regionid_seq'::regclass);
 >   ALTER TABLE public.region ALTER COLUMN regionid DROP DEFAULT;
       public          postgres    false    248    247                       2604    65773    request requestid    DEFAULT     v   ALTER TABLE ONLY public.request ALTER COLUMN requestid SET DEFAULT nextval('public.request_requestid_seq'::regclass);
 @   ALTER TABLE public.request ALTER COLUMN requestid DROP DEFAULT;
       public          postgres    false    250    249            
           2604    65774 !   requestbusiness requestbusinessid    DEFAULT     �   ALTER TABLE ONLY public.requestbusiness ALTER COLUMN requestbusinessid SET DEFAULT nextval('public.requestbusiness_requestbusinessid_seq'::regclass);
 P   ALTER TABLE public.requestbusiness ALTER COLUMN requestbusinessid DROP DEFAULT;
       public          postgres    false    252    251                       2604    65775    requestclient requestclientid    DEFAULT     �   ALTER TABLE ONLY public.requestclient ALTER COLUMN requestclientid SET DEFAULT nextval('public.requestclient_requestclientid_seq'::regclass);
 L   ALTER TABLE public.requestclient ALTER COLUMN requestclientid DROP DEFAULT;
       public          postgres    false    254    253                       2604    65776    requestclosed requestclosedid    DEFAULT     �   ALTER TABLE ONLY public.requestclosed ALTER COLUMN requestclosedid SET DEFAULT nextval('public.requestclosed_requestclosedid_seq'::regclass);
 L   ALTER TABLE public.requestclosed ALTER COLUMN requestclosedid DROP DEFAULT;
       public          postgres    false    256    255                       2604    65777    requestconcierge id    DEFAULT     z   ALTER TABLE ONLY public.requestconcierge ALTER COLUMN id SET DEFAULT nextval('public.requestconcierge_id_seq'::regclass);
 B   ALTER TABLE public.requestconcierge ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257                       2604    65778    requestnotes requestnotesid    DEFAULT     �   ALTER TABLE ONLY public.requestnotes ALTER COLUMN requestnotesid SET DEFAULT nextval('public.requestnotes_requestnotesid_seq'::regclass);
 J   ALTER TABLE public.requestnotes ALTER COLUMN requestnotesid DROP DEFAULT;
       public          postgres    false    260    259                       2604    65779 #   requeststatuslog requeststatuslogid    DEFAULT     �   ALTER TABLE ONLY public.requeststatuslog ALTER COLUMN requeststatuslogid SET DEFAULT nextval('public.requeststatuslog_requeststatuslogid_seq'::regclass);
 R   ALTER TABLE public.requeststatuslog ALTER COLUMN requeststatuslogid DROP DEFAULT;
       public          postgres    false    262    261                       2604    65780    requesttype requesttypeid    DEFAULT     �   ALTER TABLE ONLY public.requesttype ALTER COLUMN requesttypeid SET DEFAULT nextval('public.requesttype_requesttypeid_seq'::regclass);
 H   ALTER TABLE public.requesttype ALTER COLUMN requesttypeid DROP DEFAULT;
       public          postgres    false    264    263                       2604    65781 !   requestwisefile requestwisefileid    DEFAULT     �   ALTER TABLE ONLY public.requestwisefile ALTER COLUMN requestwisefileid SET DEFAULT nextval('public.requestwisefile_requestwisefileid_seq'::regclass);
 P   ALTER TABLE public.requestwisefile ALTER COLUMN requestwisefileid DROP DEFAULT;
       public          postgres    false    266    265                       2604    65782    role roleid    DEFAULT     j   ALTER TABLE ONLY public.role ALTER COLUMN roleid SET DEFAULT nextval('public.role_roleid_seq'::regclass);
 :   ALTER TABLE public.role ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    268    267                       2604    65783    rolemenu rolemenuid    DEFAULT     z   ALTER TABLE ONLY public.rolemenu ALTER COLUMN rolemenuid SET DEFAULT nextval('public.rolemenu_rolemenuid_seq'::regclass);
 B   ALTER TABLE public.rolemenu ALTER COLUMN rolemenuid DROP DEFAULT;
       public          postgres    false    270    269                       2604    65784    shift shiftid    DEFAULT     n   ALTER TABLE ONLY public.shift ALTER COLUMN shiftid SET DEFAULT nextval('public.shift_shiftid_seq'::regclass);
 <   ALTER TABLE public.shift ALTER COLUMN shiftid DROP DEFAULT;
       public          postgres    false    272    271                       2604    65785    shiftdetail shiftdetailid    DEFAULT     �   ALTER TABLE ONLY public.shiftdetail ALTER COLUMN shiftdetailid SET DEFAULT nextval('public.shiftdetail_shiftdetailid_seq'::regclass);
 H   ALTER TABLE public.shiftdetail ALTER COLUMN shiftdetailid DROP DEFAULT;
       public          postgres    false    274    273                       2604    65786 %   shiftdetailregion shiftdetailregionid    DEFAULT     �   ALTER TABLE ONLY public.shiftdetailregion ALTER COLUMN shiftdetailregionid SET DEFAULT nextval('public.shiftdetailregion_shiftdetailregionid_seq'::regclass);
 T   ALTER TABLE public.shiftdetailregion ALTER COLUMN shiftdetailregionid DROP DEFAULT;
       public          postgres    false    276    275                       2604    65787    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    279    278                      0    65579    EncounterForm 
   TABLE DATA           �  COPY public."EncounterForm" ("EncounterFormId", requestid, "HistoryOfPresentIllnessOrInjury", "MedicalHistory", "Medications", "Allergies", "Temp", "HR", "RR", "BloodPressureSystolic", "BloodPressureDiastolic", "O2", "Pain", "Heent", "CV", "Chest", "ABD", "Extremeties", "Skin", "Neuro", "Other", "Diagnosis", "TreatmentPlan", "MedicationsDispensed", "Procedures", "FollowUp", "AdminId", "PhysicianId", "IsFinalize") FROM stdin;
    public          postgres    false    215   �{                0    65586    admin 
   TABLE DATA           �   COPY public.admin (adminid, aspnetuserid, firstname, lastname, email, mobile, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, isdeleted, roleid) FROM stdin;
    public          postgres    false    217   |                0    65592    adminregion 
   TABLE DATA           G   COPY public.adminregion (adminregionid, adminid, regionid) FROM stdin;
    public          postgres    false    219   �|                 0    65596    aspnetroles 
   TABLE DATA           /   COPY public.aspnetroles (id, name) FROM stdin;
    public          postgres    false    221   �|      !          0    65599    aspnetuserroles 
   TABLE DATA           9   COPY public.aspnetuserroles (userid, roleid) FROM stdin;
    public          postgres    false    222   }      "          0    65602    aspnetusers 
   TABLE DATA           t   COPY public.aspnetusers (id, username, passwordhash, email, phonenumber, ip, createddate, modifieddate) FROM stdin;
    public          postgres    false    223   !~      #          0    65607    blockrequests 
   TABLE DATA           �   COPY public.blockrequests (blockrequestid, phonenumber, email, isactive, reason, requestid, ip, createddate, modifieddate) FROM stdin;
    public          postgres    false    224   .�      %          0    65613    business 
   TABLE DATA           �   COPY public.business (businessid, name, address1, address2, city, regionid, zipcode, phonenumber, faxnumber, isregistered, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip) FROM stdin;
    public          postgres    false    226   K�      '          0    65619    casetag 
   TABLE DATA           2   COPY public.casetag (casetagid, name) FROM stdin;
    public          postgres    false    228   h�      (          0    65622 	   concierge 
   TABLE DATA           �   COPY public.concierge (conciergeid, conciergename, address, street, city, state, zipcode, createddate, regionid, roleid) FROM stdin;
    public          postgres    false    229   �      *          0    65626    emaillog 
   TABLE DATA           �   COPY public.emaillog (emaillogid, emailtemplate, subjectname, emailid, confirmationnumber, filepath, roleid, requestid, adminid, physicianid, createdate, sentdate, isemailsent, senttries, action) FROM stdin;
    public          postgres    false    231   $�      +          0    65631    healthprofessionals 
   TABLE DATA           �   COPY public.healthprofessionals (vendorid, vendorname, profession, faxnumber, address, city, state, zip, regionid, createddate, modifieddate, phonenumber, isdeleted, ip, email, businesscontact) FROM stdin;
    public          postgres    false    232   A�      -          0    65637    healthprofessionaltype 
   TABLE DATA           x   COPY public.healthprofessionaltype (healthprofessionalid, professionname, createddate, isactive, isdeleted) FROM stdin;
    public          postgres    false    234   �      /          0    65641    menu 
   TABLE DATA           D   COPY public.menu (menuid, name, accounttype, sortorder) FROM stdin;
    public          postgres    false    236   8�      1          0    65646    orderdetails 
   TABLE DATA           �   COPY public.orderdetails (id, vendorid, requestid, faxnumber, email, businesscontact, prescription, noofrefill, createddate, createdby) FROM stdin;
    public          postgres    false    238   �      3          0    65652 	   physician 
   TABLE DATA           �  COPY public.physician (physicianid, aspnetuserid, firstname, lastname, email, mobile, medicallicense, photo, adminnotes, isagreementdoc, isbackgrounddoc, istrainingdoc, isnondisclosuredoc, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, businessname, businesswebsite, isdeleted, roleid, npinumber, islicensedoc, signature, iscredentialdoc, istokengenerate, syncemailaddress) FROM stdin;
    public          postgres    false    240   ̈́      5          0    65658    physicianlocation 
   TABLE DATA           ~   COPY public.physicianlocation (locationid, physicianid, latitude, longitude, createddate, physicianname, address) FROM stdin;
    public          postgres    false    242   Z�      6          0    65663    physiciannotification 
   TABLE DATA           W   COPY public.physiciannotification (id, physicianid, isnotificationstopped) FROM stdin;
    public          postgres    false    243   w�      8          0    65667    physicianregion 
   TABLE DATA           S   COPY public.physicianregion (physicianregionid, physicianid, regionid) FROM stdin;
    public          postgres    false    245   ��      :          0    65671    region 
   TABLE DATA           >   COPY public.region (regionid, name, abbreviation) FROM stdin;
    public          postgres    false    247   އ      <          0    65675    request 
   TABLE DATA           �  COPY public.request (requestid, requesttypeid, userid, firstname, lastname, phonenumber, email, status, physicianid, confirmationnumber, createddate, isdeleted, modifieddate, declinedby, isurgentemailsent, lastwellnessdate, ismobile, calltype, completedbyphysician, lastreservationdate, accepteddate, relationname, casenumber, ip, casetag, casetagphysician, patientaccountid, createduserid) FROM stdin;
    public          postgres    false    249   >�      >          0    65684    requestbusiness 
   TABLE DATA           W   COPY public.requestbusiness (requestbusinessid, requestid, businessid, ip) FROM stdin;
    public          postgres    false    251   �      @          0    65688    requestclient 
   TABLE DATA           s  COPY public.requestclient (requestclientid, requestid, firstname, lastname, phonenumber, location, address, regionid, notimobile, notiemail, notes, email, strmonth, intyear, intdate, ismobile, street, city, state, zipcode, communicationtype, remindreservationcount, remindhousecallcount, issetfollowupsent, ip, isreservationremindersent, latitude, longitude) FROM stdin;
    public          postgres    false    253   +�      B          0    65694    requestclosed 
   TABLE DATA           r   COPY public.requestclosed (requestclosedid, requestid, requeststatuslogid, phynotes, clientnotes, ip) FROM stdin;
    public          postgres    false    255   ��      D          0    65700    requestconcierge 
   TABLE DATA           J   COPY public.requestconcierge (id, requestid, conciergeid, ip) FROM stdin;
    public          postgres    false    257   ��      F          0    65704    requestnotes 
   TABLE DATA           �   COPY public.requestnotes (requestnotesid, requestid, strmonth, intyear, intdate, physiciannotes, adminnotes, createdby, createddate, modifiedby, modifieddate, ip, administrativenotes) FROM stdin;
    public          postgres    false    259   ʎ      H          0    65710    requeststatuslog 
   TABLE DATA           �   COPY public.requeststatuslog (requeststatuslogid, requestid, status, physicianid, adminid, transtophysicianid, notes, createddate, ip, transtoadmin) FROM stdin;
    public          postgres    false    261   �      J          0    65716    requesttype 
   TABLE DATA           :   COPY public.requesttype (requesttypeid, name) FROM stdin;
    public          postgres    false    263   (�      L          0    65720    requestwisefile 
   TABLE DATA           �   COPY public.requestwisefile (requestwisefileid, requestid, filename, createddate, physicianid, adminid, doctype, isfrontside, iscompensation, ip, isfinalize, isdeleted, ispatientrecords) FROM stdin;
    public          postgres    false    265   E�      N          0    65727    role 
   TABLE DATA           z   COPY public.role (roleid, name, accounttype, createdby, createddate, modifiedby, modifieddate, isdeleted, ip) FROM stdin;
    public          postgres    false    267   �      P          0    65732    rolemenu 
   TABLE DATA           >   COPY public.rolemenu (rolemenuid, roleid, menuid) FROM stdin;
    public          postgres    false    269   ��      R          0    65736    shift 
   TABLE DATA           |   COPY public.shift (shiftid, physicianid, startdate, isrepeat, weekdays, repeatupto, createdby, createddate, ip) FROM stdin;
    public          postgres    false    271   ��      T          0    65740    shiftdetail 
   TABLE DATA           �   COPY public.shiftdetail (shiftdetailid, shiftid, shiftdate, regionid, starttime, endtime, status, isdeleted, modifiedby, modifieddate, lastrunningdate, eventid, issync) FROM stdin;
    public          postgres    false    273   ��      V          0    65744    shiftdetailregion 
   TABLE DATA           d   COPY public.shiftdetailregion (shiftdetailregionid, shiftdetailid, regionid, isdeleted) FROM stdin;
    public          postgres    false    275   ޖ      X          0    65748    smslog 
   TABLE DATA           �   COPY public.smslog (smslogid, smstemplate, mobilenumber, confirmationnumber, roleid, adminid, requestid, physicianid, createdate, sentdate, issmssent, senttries, action) FROM stdin;
    public          postgres    false    277   ��      Y          0    65753    users 
   TABLE DATA             COPY public.users (userid, aspnetuserid, firstname, lastname, email, mobile, ismobile, street, city, state, regionid, zipcode, strmonth, intyear, intdate, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip, isrequestwithemail) FROM stdin;
    public          postgres    false    278   �      ~           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."EncounterForm_EncounterFormId_seq"', 4, true);
          public          postgres    false    216                       0    0    admin_adminid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.admin_adminid_seq', 1, true);
          public          postgres    false    218            �           0    0    adminregion_adminregionid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.adminregion_adminregionid_seq', 13, true);
          public          postgres    false    220            �           0    0     blockrequests_blockrequestid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.blockrequests_blockrequestid_seq', 1, true);
          public          postgres    false    225            �           0    0    business_businessid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.business_businessid_seq', 1, false);
          public          postgres    false    227            �           0    0    concierge_conciergeid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.concierge_conciergeid_seq', 1, false);
          public          postgres    false    230            �           0    0     healthprofessionals_vendorid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.healthprofessionals_vendorid_seq', 3, true);
          public          postgres    false    233            �           0    0 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.healthprofessionaltype_healthprofessionalid_seq', 2, true);
          public          postgres    false    235            �           0    0    menu_menuid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.menu_menuid_seq', 18, true);
          public          postgres    false    237            �           0    0    orderdetails_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orderdetails_id_seq', 4, true);
          public          postgres    false    239            �           0    0    physician_physicianid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.physician_physicianid_seq', 7, true);
          public          postgres    false    241            �           0    0    physiciannotification_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.physiciannotification_id_seq', 2, true);
          public          postgres    false    244            �           0    0 %   physicianregion_physicianregionid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.physicianregion_physicianregionid_seq', 14, true);
          public          postgres    false    246            �           0    0    region_regionid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.region_regionid_seq', 1, true);
          public          postgres    false    248            �           0    0    request_requestid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.request_requestid_seq', 109, true);
          public          postgres    false    250            �           0    0 %   requestbusiness_requestbusinessid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.requestbusiness_requestbusinessid_seq', 1, false);
          public          postgres    false    252            �           0    0 !   requestclient_requestclientid_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.requestclient_requestclientid_seq', 101, true);
          public          postgres    false    254            �           0    0 !   requestclosed_requestclosedid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.requestclosed_requestclosedid_seq', 5, true);
          public          postgres    false    256            �           0    0    requestconcierge_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.requestconcierge_id_seq', 1, false);
          public          postgres    false    258            �           0    0    requestnotes_requestnotesid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.requestnotes_requestnotesid_seq', 21, true);
          public          postgres    false    260            �           0    0 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.requeststatuslog_requeststatuslogid_seq', 48, true);
          public          postgres    false    262            �           0    0    requesttype_requesttypeid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.requesttype_requesttypeid_seq', 1, false);
          public          postgres    false    264            �           0    0 %   requestwisefile_requestwisefileid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.requestwisefile_requestwisefileid_seq', 53, true);
          public          postgres    false    266            �           0    0    role_roleid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.role_roleid_seq', 3, true);
          public          postgres    false    268            �           0    0    rolemenu_rolemenuid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.rolemenu_rolemenuid_seq', 1, false);
          public          postgres    false    270            �           0    0    shift_shiftid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.shift_shiftid_seq', 1, false);
          public          postgres    false    272            �           0    0    shiftdetail_shiftdetailid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.shiftdetail_shiftdetailid_seq', 1, false);
          public          postgres    false    274            �           0    0 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.shiftdetailregion_shiftdetailregionid_seq', 1, false);
          public          postgres    false    276            �           0    0    users_userid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_userid_seq', 21, true);
          public          postgres    false    279                       2606    65789     EncounterForm EncounterForm_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_pkey" PRIMARY KEY ("EncounterFormId");
 N   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_pkey";
       public            postgres    false    215                        2606    65791    admin admin_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (adminid);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    217            "           2606    65793    adminregion adminregion_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_pkey PRIMARY KEY (adminregionid);
 F   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_pkey;
       public            postgres    false    219            $           2606    65795    aspnetroles aspnetroles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.aspnetroles
    ADD CONSTRAINT aspnetroles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.aspnetroles DROP CONSTRAINT aspnetroles_pkey;
       public            postgres    false    221            &           2606    65797 $   aspnetuserroles aspnetuserroles_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_pkey PRIMARY KEY (userid, roleid);
 N   ALTER TABLE ONLY public.aspnetuserroles DROP CONSTRAINT aspnetuserroles_pkey;
       public            postgres    false    222    222            (           2606    65799    aspnetusers aspnetusers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.aspnetusers
    ADD CONSTRAINT aspnetusers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.aspnetusers DROP CONSTRAINT aspnetusers_pkey;
       public            postgres    false    223            *           2606    65801     blockrequests blockrequests_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.blockrequests
    ADD CONSTRAINT blockrequests_pkey PRIMARY KEY (blockrequestid);
 J   ALTER TABLE ONLY public.blockrequests DROP CONSTRAINT blockrequests_pkey;
       public            postgres    false    224            ,           2606    65803    business business_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (businessid);
 @   ALTER TABLE ONLY public.business DROP CONSTRAINT business_pkey;
       public            postgres    false    226            .           2606    65805    concierge concierge_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_pkey PRIMARY KEY (conciergeid);
 B   ALTER TABLE ONLY public.concierge DROP CONSTRAINT concierge_pkey;
       public            postgres    false    229            0           2606    65807    emaillog emaillog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.emaillog
    ADD CONSTRAINT emaillog_pkey PRIMARY KEY (emaillogid);
 @   ALTER TABLE ONLY public.emaillog DROP CONSTRAINT emaillog_pkey;
       public            postgres    false    231            2           2606    65809 ,   healthprofessionals healthprofessionals_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_pkey PRIMARY KEY (vendorid);
 V   ALTER TABLE ONLY public.healthprofessionals DROP CONSTRAINT healthprofessionals_pkey;
       public            postgres    false    232            4           2606    65811 2   healthprofessionaltype healthprofessionaltype_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.healthprofessionaltype
    ADD CONSTRAINT healthprofessionaltype_pkey PRIMARY KEY (healthprofessionalid);
 \   ALTER TABLE ONLY public.healthprofessionaltype DROP CONSTRAINT healthprofessionaltype_pkey;
       public            postgres    false    234            6           2606    65813    menu menu_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menuid);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public            postgres    false    236            8           2606    65815    orderdetails orderdetails_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_pkey;
       public            postgres    false    238            :           2606    65817    physician physician_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_pkey PRIMARY KEY (physicianid);
 B   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_pkey;
       public            postgres    false    240            <           2606    65819 0   physiciannotification physiciannotification_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.physiciannotification DROP CONSTRAINT physiciannotification_pkey;
       public            postgres    false    243            >           2606    65821 $   physicianregion physicianregion_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_pkey PRIMARY KEY (physicianregionid);
 N   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_pkey;
       public            postgres    false    245            @           2606    65823    region region_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (regionid);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public            postgres    false    247            B           2606    65825    request request_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (requestid);
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public            postgres    false    249            D           2606    65827 $   requestbusiness requestbusiness_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_pkey PRIMARY KEY (requestbusinessid);
 N   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_pkey;
       public            postgres    false    251            F           2606    65829     requestclient requestclient_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_pkey PRIMARY KEY (requestclientid);
 J   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_pkey;
       public            postgres    false    253            H           2606    65831     requestclosed requestclosed_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_pkey PRIMARY KEY (requestclosedid);
 J   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_pkey;
       public            postgres    false    255            J           2606    65833 &   requestconcierge requestconcierge_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_pkey;
       public            postgres    false    257            L           2606    65835    requestnotes requestnotes_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_pkey PRIMARY KEY (requestnotesid);
 H   ALTER TABLE ONLY public.requestnotes DROP CONSTRAINT requestnotes_pkey;
       public            postgres    false    259            N           2606    65837 &   requeststatuslog requeststatuslog_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_pkey PRIMARY KEY (requeststatuslogid);
 P   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_pkey;
       public            postgres    false    261            P           2606    65839    requesttype requesttype_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.requesttype
    ADD CONSTRAINT requesttype_pkey PRIMARY KEY (requesttypeid);
 F   ALTER TABLE ONLY public.requesttype DROP CONSTRAINT requesttype_pkey;
       public            postgres    false    263            R           2606    65841 $   requestwisefile requestwisefile_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_pkey PRIMARY KEY (requestwisefileid);
 N   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_pkey;
       public            postgres    false    265            T           2606    65843    role role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (roleid);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    267            V           2606    65845    rolemenu rolemenu_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_pkey PRIMARY KEY (rolemenuid);
 @   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_pkey;
       public            postgres    false    269            X           2606    65847    shift shift_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_pkey PRIMARY KEY (shiftid);
 :   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_pkey;
       public            postgres    false    271            Z           2606    65849    shiftdetail shiftdetail_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_pkey PRIMARY KEY (shiftdetailid);
 F   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_pkey;
       public            postgres    false    273            \           2606    65851 (   shiftdetailregion shiftdetailregion_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_pkey PRIMARY KEY (shiftdetailregionid);
 R   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_pkey;
       public            postgres    false    275            ^           2606    65853    smslog smslog_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.smslog
    ADD CONSTRAINT smslog_pkey PRIMARY KEY (smslogid);
 <   ALTER TABLE ONLY public.smslog DROP CONSTRAINT smslog_pkey;
       public            postgres    false    277            `           2606    65855    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    278            a           2606    65856 (   EncounterForm EncounterForm_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public.admin(adminid);
 V   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_AdminId_fkey";
       public          postgres    false    215    4896    217            b           2606    65861 ,   EncounterForm EncounterForm_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_PhysicianId_fkey";
       public          postgres    false    240    215    4922            c           2606    65866 *   EncounterForm EncounterForm_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_requestid_fkey" FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_requestid_fkey";
       public          postgres    false    4930    249    215            d           2606    65871    admin admin_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 G   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_aspnetuserid_fkey;
       public          postgres    false    223    4904    217            e           2606    65876 $   adminregion adminregion_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 N   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_adminid_fkey;
       public          postgres    false    4896    217    219            f           2606    65881 %   adminregion adminregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 O   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_regionid_fkey;
       public          postgres    false    247    219    4928            g           2606    65886 +   aspnetuserroles aspnetuserroles_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_userid_fkey FOREIGN KEY (userid) REFERENCES public.aspnetusers(id);
 U   ALTER TABLE ONLY public.aspnetuserroles DROP CONSTRAINT aspnetuserroles_userid_fkey;
       public          postgres    false    222    223    4904            h           2606    65891    business business_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 I   ALTER TABLE ONLY public.business DROP CONSTRAINT business_regionid_fkey;
       public          postgres    false    226    4928    247            i           2606    65896 !   concierge concierge_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 K   ALTER TABLE ONLY public.concierge DROP CONSTRAINT concierge_regionid_fkey;
       public          postgres    false    229    247    4928            j           2606    65901 7   healthprofessionals healthprofessionals_profession_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_profession_fkey FOREIGN KEY (profession) REFERENCES public.healthprofessionaltype(healthprofessionalid);
 a   ALTER TABLE ONLY public.healthprofessionals DROP CONSTRAINT healthprofessionals_profession_fkey;
       public          postgres    false    4916    232    234            k           2606    65906 %   physician physician_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 O   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_aspnetuserid_fkey;
       public          postgres    false    223    240    4904            l           2606    65911 4   physicianlocation physicianlocation_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianlocation
    ADD CONSTRAINT physicianlocation_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 ^   ALTER TABLE ONLY public.physicianlocation DROP CONSTRAINT physicianlocation_physicianid_fkey;
       public          postgres    false    240    4922    242            m           2606    65916 <   physiciannotification physiciannotification_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 f   ALTER TABLE ONLY public.physiciannotification DROP CONSTRAINT physiciannotification_physicianid_fkey;
       public          postgres    false    240    4922    243            n           2606    65921 0   physicianregion physicianregion_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_physicianid_fkey;
       public          postgres    false    240    4922    245            o           2606    65926 -   physicianregion physicianregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 W   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_regionid_fkey;
       public          postgres    false    245    247    4928            p           2606    65931     request request_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 J   ALTER TABLE ONLY public.request DROP CONSTRAINT request_physicianid_fkey;
       public          postgres    false    249    240    4922            q           2606    65936    request request_userid_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);
 E   ALTER TABLE ONLY public.request DROP CONSTRAINT request_userid_fkey;
       public          postgres    false    278    4960    249            r           2606    65941 /   requestbusiness requestbusiness_businessid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_businessid_fkey FOREIGN KEY (businessid) REFERENCES public.business(businessid);
 Y   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_businessid_fkey;
       public          postgres    false    251    226    4908            s           2606    65946 .   requestbusiness requestbusiness_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_requestid_fkey;
       public          postgres    false    4930    249    251            t           2606    65951 )   requestclient requestclient_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 S   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_regionid_fkey;
       public          postgres    false    253    4928    247            u           2606    65956 *   requestclient requestclient_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 T   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_requestid_fkey;
       public          postgres    false    253    4930    249            v           2606    65961 *   requestclosed requestclosed_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 T   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_requestid_fkey;
       public          postgres    false    249    255    4930            w           2606    65966 3   requestclosed requestclosed_requeststatuslogid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requeststatuslogid_fkey FOREIGN KEY (requeststatuslogid) REFERENCES public.requeststatuslog(requeststatuslogid);
 ]   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_requeststatuslogid_fkey;
       public          postgres    false    4942    255    261            x           2606    65971 2   requestconcierge requestconcierge_conciergeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_conciergeid_fkey FOREIGN KEY (conciergeid) REFERENCES public.concierge(conciergeid);
 \   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_conciergeid_fkey;
       public          postgres    false    4910    257    229            y           2606    65976 0   requestconcierge requestconcierge_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 Z   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_requestid_fkey;
       public          postgres    false    249    257    4930            z           2606    65981 (   requestnotes requestnotes_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 R   ALTER TABLE ONLY public.requestnotes DROP CONSTRAINT requestnotes_requestid_fkey;
       public          postgres    false    259    4930    249            {           2606    65986 .   requeststatuslog requeststatuslog_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 X   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_adminid_fkey;
       public          postgres    false    4896    261    217            |           2606    65991 2   requeststatuslog requeststatuslog_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 \   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_physicianid_fkey;
       public          postgres    false    4922    240    261            }           2606    65996 0   requeststatuslog requeststatuslog_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 Z   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_requestid_fkey;
       public          postgres    false    261    249    4930            ~           2606    66001 9   requeststatuslog requeststatuslog_transtophysicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_transtophysicianid_fkey FOREIGN KEY (transtophysicianid) REFERENCES public.physician(physicianid);
 c   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_transtophysicianid_fkey;
       public          postgres    false    261    240    4922                       2606    66006 ,   requestwisefile requestwisefile_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 V   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_adminid_fkey;
       public          postgres    false    217    4896    265            �           2606    66011 0   requestwisefile requestwisefile_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_physicianid_fkey;
       public          postgres    false    4922    240    265            �           2606    66016 .   requestwisefile requestwisefile_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_requestid_fkey;
       public          postgres    false    265    249    4930            �           2606    66021    rolemenu rolemenu_menuid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_menuid_fkey FOREIGN KEY (menuid) REFERENCES public.menu(menuid);
 G   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_menuid_fkey;
       public          postgres    false    236    269    4918            �           2606    66026    rolemenu rolemenu_roleid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.role(roleid);
 G   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_roleid_fkey;
       public          postgres    false    4948    267    269            �           2606    66031    shift shift_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.aspnetusers(id);
 D   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_createdby_fkey;
       public          postgres    false    223    271    4904            �           2606    66036    shift shift_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 F   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_physicianid_fkey;
       public          postgres    false    240    4922    271            �           2606    66041 '   shiftdetail shiftdetail_modifiedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_modifiedby_fkey FOREIGN KEY (modifiedby) REFERENCES public.aspnetusers(id);
 Q   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_modifiedby_fkey;
       public          postgres    false    273    4904    223            �           2606    66046 $   shiftdetail shiftdetail_shiftid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_shiftid_fkey FOREIGN KEY (shiftid) REFERENCES public.shift(shiftid);
 N   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_shiftid_fkey;
       public          postgres    false    271    273    4952            �           2606    66051 1   shiftdetailregion shiftdetailregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 [   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_regionid_fkey;
       public          postgres    false    247    275    4928            �           2606    66056 6   shiftdetailregion shiftdetailregion_shiftdetailid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_shiftdetailid_fkey FOREIGN KEY (shiftdetailid) REFERENCES public.shiftdetail(shiftdetailid);
 `   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_shiftdetailid_fkey;
       public          postgres    false    275    273    4954            �           2606    66061    users users_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_aspnetuserid_fkey;
       public          postgres    false    4904    278    223               ]   x�3�0�L)N�b�?�4.cN+%hvZ:�	��IRi��S�!�@��&��������.NC3�#��$���:�7����� I}F�         �   x���;�0k���Z���q�iL�E�D��!%H��k����ƖA�l�����]��u���c[��q�|�Ma�/�E��Fݳ?n}���ղ$7�~k2��e矣 �@VX
� 9g�������/�i?�            x�34�4�4�24R&\1z\\\ �p          5   x�3�tL����2�H,�L�+�2�(�/�LI-�2��M,.I-R������� m�=      !   �   x����1��\�	��"���0�z���C4	� � �\\n�:�k�C��&VPS&7�$q�x�+;k+�����u�&�)�X��91��.p	��Z��J�ϖ��%��b�W,�Δy����U��Zgj�m�b��Y����*�����Qئhf��7f�I&�=�����}x�Ʈ���Ę�_ *��Us<�6�Ǝ�]�6������M^h9<�п������a�      "   �  x���]n[7���Ux�������dy�/�Ɩ[N뮾C��"Kv\�B��3C����NRWǣ��(.��J�q�������������a��� }PA"��_��/d��a�Ye>�K
V�fNG5�c��TJpJ���:F��������׿���'(L!�&� �;�V��$*�	��0pC'���G�KrYzI#C��ҏ�K��	K��P��F���W�6�,,.u�NcO2���������w@����>�4�J����Q�q���!�)Y�[{��7����0�II#�n������0-��Ҽ��q��?}���pK���%�Ý7�|&��(D����-���[I�t-%4�s+�c>��K;���<����vO�g~�?���o�׋f�#��.�wH+�ʸ@ �Y݆Ԛ)��7�6N�p.AQCh-��/������@�8��z@ċN���i��ZB��*�M]Ik7o[ϝ��{�6e�.G?e�ֺ�
c���˄O�n����s�>,�XF4��-�MgJ�<��G�a3^)kZBW���m�؇�͏o�ϻ��{�����-��VX�����4��� ��+�)P�� {�W� �*�Q����*z�9���p��,@�5��+���qlⲟ�Zr�<
��3I>�qU���$s��u��#.�Lz�LW۸�4 u'��,+����.�gT�T�U�3C$��B�A���)�a�h����6e.�n��an�u&~*�jB��F��Bh��Y�؇�B��l�� ���      #      x������ � �      %      x������ � �      '   �   x�͎M
�@FדS� "Կ�tc7��M('C��o����㽯���V�0��L9�(:�}�����������`��a(֔��?r��(o����2�q�;R�*U9c\����)LY����s*i^����2t�}����l9      (      x������ � �      *      x������ � �      +   �   x�}�M
�0�דSx%�Ob��۞�MhT�@��׈�vSxo���CX��O����[�����4[�5�.��AuC���sM�����SP� �ŰX#�:t?��=�l�V�J��J0�X�avm������{�F�j��?������ aRu��� �#>t      -   7   x�3�,(�OK-.���3�4202�50�50W00�#NC�?.#$eF����qqq z9Q      /   �   x�]�M�0�s�c�Ω���ǘ��Km3W,���w�:��<��aPp�\�[	.�$���SI�a��	�<�2ؿ��Zi0��hP�Z�[�YcG�{E&��nB�+d���J����(�ɾ�.`)���-6�s��ۚ��1����P�E��y�	�����u�}"��\�M�H�2��ni>h$<�+�Q�$o��b�      1   �   x���K
�@�u��@�����'�n$4B��NDP\y�zUE �aV��0���w������X�\�T����i:M%��ڠ4���Y%K$��`8�+��c��cI���œ�f�����7H_������q�9ƚ0�e�d�ζqZ&�_�aY�> ����I�_����'�Pz      3   }  x���͎� ���)�8�\��U�v�ը���'N�g���%�&I��tU��+$��~�"�-גi
^��:�����	k.���5uM�j��tp]��4�E3�`
�P��&P;��|.��{
c��S��U���؄��i��_]�_��zyy�a��o��.�0$��.űk�̒���8�ǐ�*�oC�NjcK�����ɢP&�0k�K�J��Q���^����d;M�Tn6Yhqp�pNa��6l�О{7���tٻ��>���n
�<��˒����5~��/TO+M��c�"d8����K���M�^.�p@J��h"�U�[�b���0@��K���n��c<z��2��,���[�cJ��0���@>B&��2�Akc��A�,9=5�������&�,���6 d�f&�Gk0��{��f�FC����
f}��d%����>��1z�F��w}�D�1��45�h�#p<�}�M���]��y�R�!2BP&L���ryu�?t��q��:�1��;��;�KԮ��~�r@$��Ѳ�K��^��.!����@k4���5M>�C-FM�Q+�����R��,�}����y�.W�nK~�H�@�K.�9�|<X���쪨��j���~�      5      x������ � �      6      x������ � �      8   :   x���� ���0��hw��s��-�Y*MoX>j����<ZL	jgjsN!Z���a�6��      :   P   x�3��K-W��/����2��,J���L��2��M,��I�K����2�t�,.)�L.Q�OSp��)�M�sq����� x      <   �  x���]S�@���_�e{�ߛ�K�X�QǢ�)3�,�H,D[����M1�@%�� �������C�����=�Z"��*ۥЌz�#"v��%��R~��c���bڥ�~�������侖'�ܟ��#��]�oC�=��>h�kO�c:_���O8�5���͋�#������z�ΞM:w$.R�#O2�n# !�G�� �g�?]�p�	d��P�d���=�S�9}�a}Fw;��QPh����8�:�\H%�B��ʄ����_q�j�}|H���d��Kq
��/���/�8Cc֑~�7��E��<�҂��s>ϲ�Vp
�hT
ο���T~��EN��v����	9L�9���!`�Z
�	��Ci*S��)ʱ XS4�"xL�e����uɛ 78�=�vEo�E��6�-RH^����]�+�K,,�]|oQ@�6�(ZĦCC�wIXr������}t�ԛX�4Q&��[��7z�8i}q6l�?0x[ѠU:��U�v Jք����'�-���%kTfm7������X!d�HaM91�d�q.i8N_M��٥�-�^�$�vՠ��vӒ���r�Ѷ}��H�DՐ��!�!�"�~�&] �4A�Z�t��`������(�,�-������@qlf�K�&%  �S"���dC�兩fvNm�UR�� ����N��B���      >      x������ � �      @   I  x��V�n�@]_�d�^3;�H�Cm�T�U6c�.�����b�`jG�*!f��9�s����JRx;���e��Ӄ~���	�b��j:/�@P�Ɨ�u�w�y�l�E��ߨ����6�!��_[��f���*��!��/eA  ��6o��|7`�k�\s΋�B���V�i�}�q'ϰe����ix
1���b�J<�s(�rv�G���a!�����<RUJإ�"�Sy&�Ә>|���Ŵ	���9��&�a&Q��L�����@��*ӹ���B����/�|f�a)U�7rp]��U��lU̳HZyQEml���jχV+�@%��d���V��4
�5E�Y���^�t�;�ޔ_T���2�5� �񠱰�:�s�xF�x�z��$�B�-���8�B�Y:��� Ee���4��/B��Pc�W+���������W�4r�<l�#BIY�X���h�):r�!~���`�j�A���-�' ����J���`EvY��TB��T*�Դ%R�?��V��"�	��Q��Y��n��Mt��N3��&K({�03�H����܍�*���e%x@Q~hQ�����B��!
X��Yh��{rq6���E��#H�9��K�����
�����)��K�M���"=$��#�=p����$�S7�Y;���p ����^�z"��Y����zz��n v}x��ml�sOs���~G��PzˍP	�&�H����7��)��,��fp�C���d��������S�u1��6mȎ�e�� ��c�>$z~�2,�j��ך�-؏�v�}��O�i:�L� :{�      B      x�3�0�42�� �=... .:�      D      x������ � �      F   =  x����n� �g�� ���4k�t阅ش��:ml��ۗ�Q]�d�tB���8�y˶���n�y����k����0����~v׫ˑ�@���a�M�=�L����b�=@|ɠ��\ic�vcw�����S�[o����4 �L��˔��3�[�8B0Iek��,L/�f
�����kɺ�Ao�B[S�hӮ~m�5*΂ȑ�r��T�KA��a���S���7ߝ���v�� �4V+,�C���le��@���/U�� /�~I�8�^�D��d�q��=�S��7ϫw9	� ^*0K���������      H     x���Mn�0���)x|?����٨��ȉ��rQ��%i����h n�{�yC�pF�x�1�M7n���a|��n�j��5	&���;c�/�8�p�y�����5���G
�=7]���� �e��c# d��ȨgM� �^	�����:��0D�Ju�p6�����a/���<�[?nS����,���ԡK5�ӱ���X���i��(��G4H� �y:�J�$�M��4��$I^@	>B���l��d�sy�f&��AA�l��HnJWH�K]IV���+k�#_I.���S��f{wJ[b�C���^��ND�
����H��#	�\2��l��E�l�0l��u�.��x��*�7���0܈B�9�"�=Ք1��K��� �ŧ��g�$��"�t��`[�C�4���]6����ҸԽZYdh;�Ҿ�]���N]S�����?4dS�����5���_�j�����4����р҆��1��m�k�s-��Z����+6      J      x������ � �      L   �  x��U]k$7|^���j��%͛c�q���E��M�;�g}!�>�u��=������RU��;�;�%�،���U��<g�m���{����;�L���۝5�q��v60#jg�v�>�q��+����Fe�U��Q��A�K�l���p�z��w��T��9/�N���5��tn�Ơ��lX#GǼ5Fc$���T��bn*1!֜: ��1pv8��d��Ê����ǥ.Eߟ��c��:F�`#�t��w1a4�HY�Ia�Y�T@��k��-:�&��v����[�h�-� �y��Lr9W�c��|✋��X.�d�Cϊ�Ŋ�!��(���)?��S[��>ݶ2�Ďڋ�6�i��T�����Ze�ck�g�c
%���=�<4�;���t}<��۲6�a��<�s!��(��$��-z���O�z�=ݵ�y�z���"��9��a��p��m�?�}��7����h���C!�}���l��,�X�kr��Kڿ������:8K��̈�VL�N[����*W �[��U����#��aǳ��qpq+d0P7�)�N(3�"�t9d_
�/�屪��㒪:���/�P�F�'���J��u(=uE(i�RPeg��P�Q���+N7���y�{y|�>>,_�=|�ٚ	�<N�H�[���Q�Kɣ�Z�Qq��/&���@)��K�c*i}�}��(-Wm�M���G��	�Ժd�d��N���f�x����o��_/r��c:$�HQ���u<�%�;7~�Ւ��誒� ���JP�i9�v�^lϘ5����4>�7L�lsI�gOF�o��]�pgWrI��/�c��qYۓ�/�Z`�,�x��ج ��e���=��x�m^��ؼ-$��_]�e>��6"���»��dL�ª� ���N�qy�1�Pe��QU~6n&�΂���?髫� ��*O      N   i   x�3�tL�����I�4�46O123O1�55�0�5102�ML1��M4KM�LK6L15N�4202�50�52W00�#�?�\��E�e�)�E`C�H4���1z\\\ Og(�      P      x������ � �      R      x������ � �      T      x������ � �      V      x������ � �      X      x������ � �      Y   X  x���Mn�0���S�8$�?^9�h�HwE6C����R`�N�ӗ���M6J�@�{o� ��VIJFP�^��F��D\r������8B�y���jYl���v؃�HD���o���p�C�_n���	T�JC��<����R	eo��4��{�H�9u ��1����.'�wFd/<E+���R�m)^r����޳0��֑f>q��`χ���:@W*����Ȱ6�Fߠ���:�\P��]Z&T;C!�"�6^��!�i:_�� %S��]L$��a�����W22֕4�X���-$ʵtk��G��אJBJ���Qx���ܚ�����hSMC�p{>�[���`���M�>O��O�;�?6�q���v�uſ\َ?>AO�t��Wz�/��>F"����լE��X�R�%8!�fa��5��
�W�ڔl���W9���yx~�^TJ]̪!�]��n5�:��^'��u5gWV�MS-7F}�jٯ�¹j���4�8r�^)s֑��9˚z�;Y�f�)e߶X���u�xY\���y�U���.p>���y���v�GN�v�p.�En��1��r�~-�lG�Ҿo��f�Z�U�-H     