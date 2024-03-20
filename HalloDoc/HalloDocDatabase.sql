PGDMP                       |            HalloDoc    16.2    16.2    \           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ]           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ^           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            _           1262    16973    HalloDoc    DATABASE     �   CREATE DATABASE "HalloDoc" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "HalloDoc";
                postgres    false            �            1259    16974    EncounterForm    TABLE     �  CREATE TABLE public."EncounterForm" (
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
       public         heap    postgres    false            �            1259    16980 !   EncounterForm_EncounterFormId_seq    SEQUENCE     �   CREATE SEQUENCE public."EncounterForm_EncounterFormId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."EncounterForm_EncounterFormId_seq";
       public          postgres    false    215            `           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."EncounterForm_EncounterFormId_seq" OWNED BY public."EncounterForm"."EncounterFormId";
          public          postgres    false    216            �            1259    16981    admin    TABLE     �  CREATE TABLE public.admin (
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
       public         heap    postgres    false            �            1259    16986    admin_adminid_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_adminid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.admin_adminid_seq;
       public          postgres    false    217            a           0    0    admin_adminid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.admin_adminid_seq OWNED BY public.admin.adminid;
          public          postgres    false    218            �            1259    16987    adminregion    TABLE     �   CREATE TABLE public.adminregion (
    adminregionid integer NOT NULL,
    adminid integer NOT NULL,
    regionid integer NOT NULL
);
    DROP TABLE public.adminregion;
       public         heap    postgres    false            �            1259    16990    adminregion_adminregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.adminregion_adminregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.adminregion_adminregionid_seq;
       public          postgres    false    219            b           0    0    adminregion_adminregionid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.adminregion_adminregionid_seq OWNED BY public.adminregion.adminregionid;
          public          postgres    false    220            �            1259    16991    aspnetroles    TABLE     v   CREATE TABLE public.aspnetroles (
    id character varying(128) NOT NULL,
    name character varying(256) NOT NULL
);
    DROP TABLE public.aspnetroles;
       public         heap    postgres    false            �            1259    16994    aspnetuserroles    TABLE     �   CREATE TABLE public.aspnetuserroles (
    userid character varying(128) NOT NULL,
    roleid character varying(128) NOT NULL
);
 #   DROP TABLE public.aspnetuserroles;
       public         heap    postgres    false            �            1259    16997    aspnetusers    TABLE     i  CREATE TABLE public.aspnetusers (
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
       public         heap    postgres    false            �            1259    17002    blockrequests    TABLE     m  CREATE TABLE public.blockrequests (
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
       public         heap    postgres    false            �            1259    17007     blockrequests_blockrequestid_seq    SEQUENCE     �   CREATE SEQUENCE public.blockrequests_blockrequestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.blockrequests_blockrequestid_seq;
       public          postgres    false    224            c           0    0     blockrequests_blockrequestid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.blockrequests_blockrequestid_seq OWNED BY public.blockrequests.blockrequestid;
          public          postgres    false    225            �            1259    17008    business    TABLE     n  CREATE TABLE public.business (
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
       public         heap    postgres    false            �            1259    17013    business_businessid_seq    SEQUENCE     �   CREATE SEQUENCE public.business_businessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.business_businessid_seq;
       public          postgres    false    226            d           0    0    business_businessid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.business_businessid_seq OWNED BY public.business.businessid;
          public          postgres    false    227            �            1259    17014    casetag    TABLE     i   CREATE TABLE public.casetag (
    casetagid integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.casetag;
       public         heap    postgres    false            �            1259    17017 	   concierge    TABLE     �  CREATE TABLE public.concierge (
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
       public         heap    postgres    false            �            1259    17020    concierge_conciergeid_seq    SEQUENCE     �   CREATE SEQUENCE public.concierge_conciergeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.concierge_conciergeid_seq;
       public          postgres    false    229            e           0    0    concierge_conciergeid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.concierge_conciergeid_seq OWNED BY public.concierge.conciergeid;
          public          postgres    false    230            �            1259    17021    emaillog    TABLE       CREATE TABLE public.emaillog (
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
       public         heap    postgres    false            �            1259    17026    healthprofessionals    TABLE     i  CREATE TABLE public.healthprofessionals (
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
       public         heap    postgres    false            �            1259    17031     healthprofessionals_vendorid_seq    SEQUENCE     �   CREATE SEQUENCE public.healthprofessionals_vendorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.healthprofessionals_vendorid_seq;
       public          postgres    false    232            f           0    0     healthprofessionals_vendorid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.healthprofessionals_vendorid_seq OWNED BY public.healthprofessionals.vendorid;
          public          postgres    false    233            �            1259    17032    healthprofessionaltype    TABLE     �   CREATE TABLE public.healthprofessionaltype (
    healthprofessionalid integer NOT NULL,
    professionname character varying(50) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    isactive bit(1),
    isdeleted bit(1)
);
 *   DROP TABLE public.healthprofessionaltype;
       public         heap    postgres    false            �            1259    17035 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE     �   CREATE SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq;
       public          postgres    false    234            g           0    0 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq OWNED BY public.healthprofessionaltype.healthprofessionalid;
          public          postgres    false    235            �            1259    17036    menu    TABLE     �   CREATE TABLE public.menu (
    menuid integer NOT NULL,
    name character varying(50) NOT NULL,
    accounttype smallint NOT NULL,
    sortorder integer,
    CONSTRAINT menu_accounttype_check CHECK ((accounttype = ANY (ARRAY[1, 2])))
);
    DROP TABLE public.menu;
       public         heap    postgres    false            �            1259    17040    menu_menuid_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_menuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.menu_menuid_seq;
       public          postgres    false    236            h           0    0    menu_menuid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.menu_menuid_seq OWNED BY public.menu.menuid;
          public          postgres    false    237            �            1259    17041    orderdetails    TABLE     l  CREATE TABLE public.orderdetails (
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
       public         heap    postgres    false            �            1259    17046    orderdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orderdetails_id_seq;
       public          postgres    false    238            i           0    0    orderdetails_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orderdetails_id_seq OWNED BY public.orderdetails.id;
          public          postgres    false    239            �            1259    17047 	   physician    TABLE     �  CREATE TABLE public.physician (
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
       public         heap    postgres    false            �            1259    17052    physician_physicianid_seq    SEQUENCE     �   CREATE SEQUENCE public.physician_physicianid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.physician_physicianid_seq;
       public          postgres    false    240            j           0    0    physician_physicianid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.physician_physicianid_seq OWNED BY public.physician.physicianid;
          public          postgres    false    241            �            1259    17053    physicianlocation    TABLE       CREATE TABLE public.physicianlocation (
    locationid integer NOT NULL,
    physicianid integer,
    latitude numeric(9,2),
    longitude numeric(9,2),
    createddate timestamp without time zone,
    physicianname character varying(50),
    address character varying(500)
);
 %   DROP TABLE public.physicianlocation;
       public         heap    postgres    false            �            1259    17058    physiciannotification    TABLE     �   CREATE TABLE public.physiciannotification (
    id integer NOT NULL,
    physicianid integer,
    isnotificationstopped bit(1)
);
 )   DROP TABLE public.physiciannotification;
       public         heap    postgres    false            �            1259    17061    physiciannotification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.physiciannotification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.physiciannotification_id_seq;
       public          postgres    false    243            k           0    0    physiciannotification_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.physiciannotification_id_seq OWNED BY public.physiciannotification.id;
          public          postgres    false    244            �            1259    17062    physicianregion    TABLE        CREATE TABLE public.physicianregion (
    physicianregionid integer NOT NULL,
    physicianid integer,
    regionid integer
);
 #   DROP TABLE public.physicianregion;
       public         heap    postgres    false            �            1259    17065 %   physicianregion_physicianregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.physicianregion_physicianregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.physicianregion_physicianregionid_seq;
       public          postgres    false    245            l           0    0 %   physicianregion_physicianregionid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.physicianregion_physicianregionid_seq OWNED BY public.physicianregion.physicianregionid;
          public          postgres    false    246            �            1259    17066    region    TABLE     �   CREATE TABLE public.region (
    regionid integer NOT NULL,
    name character varying(50) NOT NULL,
    abbreviation character varying(50)
);
    DROP TABLE public.region;
       public         heap    postgres    false            �            1259    17069    region_regionid_seq    SEQUENCE     �   CREATE SEQUENCE public.region_regionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.region_regionid_seq;
       public          postgres    false    247            m           0    0    region_regionid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.region_regionid_seq OWNED BY public.region.regionid;
          public          postgres    false    248            �            1259    17070    request    TABLE     �  CREATE TABLE public.request (
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
       public         heap    postgres    false            �            1259    17078    request_requestid_seq    SEQUENCE     �   CREATE SEQUENCE public.request_requestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.request_requestid_seq;
       public          postgres    false    249            n           0    0    request_requestid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.request_requestid_seq OWNED BY public.request.requestid;
          public          postgres    false    250            �            1259    17079    requestbusiness    TABLE     �   CREATE TABLE public.requestbusiness (
    requestbusinessid integer NOT NULL,
    requestid integer NOT NULL,
    businessid integer NOT NULL,
    ip character varying(20)
);
 #   DROP TABLE public.requestbusiness;
       public         heap    postgres    false            �            1259    17082 %   requestbusiness_requestbusinessid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestbusiness_requestbusinessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.requestbusiness_requestbusinessid_seq;
       public          postgres    false    251            o           0    0 %   requestbusiness_requestbusinessid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.requestbusiness_requestbusinessid_seq OWNED BY public.requestbusiness.requestbusinessid;
          public          postgres    false    252            �            1259    17083    requestclient    TABLE     �  CREATE TABLE public.requestclient (
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
       public         heap    postgres    false            �            1259    17088 !   requestclient_requestclientid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestclient_requestclientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.requestclient_requestclientid_seq;
       public          postgres    false    253            p           0    0 !   requestclient_requestclientid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.requestclient_requestclientid_seq OWNED BY public.requestclient.requestclientid;
          public          postgres    false    254            �            1259    17089    requestclosed    TABLE        CREATE TABLE public.requestclosed (
    requestclosedid integer NOT NULL,
    requestid integer NOT NULL,
    requeststatuslogid integer NOT NULL,
    phynotes character varying(500),
    clientnotes character varying(500),
    ip character varying(20)
);
 !   DROP TABLE public.requestclosed;
       public         heap    postgres    false                        1259    17094 !   requestclosed_requestclosedid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestclosed_requestclosedid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.requestclosed_requestclosedid_seq;
       public          postgres    false    255            q           0    0 !   requestclosed_requestclosedid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.requestclosed_requestclosedid_seq OWNED BY public.requestclosed.requestclosedid;
          public          postgres    false    256                       1259    17095    requestconcierge    TABLE     �   CREATE TABLE public.requestconcierge (
    id integer NOT NULL,
    requestid integer NOT NULL,
    conciergeid integer NOT NULL,
    ip character varying(20)
);
 $   DROP TABLE public.requestconcierge;
       public         heap    postgres    false                       1259    17098    requestconcierge_id_seq    SEQUENCE     �   CREATE SEQUENCE public.requestconcierge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.requestconcierge_id_seq;
       public          postgres    false    257            r           0    0    requestconcierge_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.requestconcierge_id_seq OWNED BY public.requestconcierge.id;
          public          postgres    false    258                       1259    17099    requestnotes    TABLE       CREATE TABLE public.requestnotes (
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
       public         heap    postgres    false                       1259    17104    requestnotes_requestnotesid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestnotes_requestnotesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.requestnotes_requestnotesid_seq;
       public          postgres    false    259            s           0    0    requestnotes_requestnotesid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.requestnotes_requestnotesid_seq OWNED BY public.requestnotes.requestnotesid;
          public          postgres    false    260                       1259    17105    requeststatuslog    TABLE     m  CREATE TABLE public.requeststatuslog (
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
       public         heap    postgres    false                       1259    17110 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE     �   CREATE SEQUENCE public.requeststatuslog_requeststatuslogid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.requeststatuslog_requeststatuslogid_seq;
       public          postgres    false    261            t           0    0 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.requeststatuslog_requeststatuslogid_seq OWNED BY public.requeststatuslog.requeststatuslogid;
          public          postgres    false    262                       1259    17111    requesttype    TABLE     q   CREATE TABLE public.requesttype (
    requesttypeid integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.requesttype;
       public         heap    postgres    false                       1259    17114    requesttype_requesttypeid_seq    SEQUENCE     �   CREATE SEQUENCE public.requesttype_requesttypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.requesttype_requesttypeid_seq;
       public          postgres    false    263            u           0    0    requesttype_requesttypeid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.requesttype_requesttypeid_seq OWNED BY public.requesttype.requesttypeid;
          public          postgres    false    264            	           1259    17115    requestwisefile    TABLE     
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
           1259    17121 %   requestwisefile_requestwisefileid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestwisefile_requestwisefileid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.requestwisefile_requestwisefileid_seq;
       public          postgres    false    265            v           0    0 %   requestwisefile_requestwisefileid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.requestwisefile_requestwisefileid_seq OWNED BY public.requestwisefile.requestwisefileid;
          public          postgres    false    266                       1259    17122    role    TABLE     �  CREATE TABLE public.role (
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
       public         heap    postgres    false                       1259    17126    role_roleid_seq    SEQUENCE     �   CREATE SEQUENCE public.role_roleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.role_roleid_seq;
       public          postgres    false    267            w           0    0    role_roleid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.role_roleid_seq OWNED BY public.role.roleid;
          public          postgres    false    268                       1259    17127    rolemenu    TABLE     j   CREATE TABLE public.rolemenu (
    rolemenuid integer NOT NULL,
    roleid integer,
    menuid integer
);
    DROP TABLE public.rolemenu;
       public         heap    postgres    false                       1259    17130    rolemenu_rolemenuid_seq    SEQUENCE     �   CREATE SEQUENCE public.rolemenu_rolemenuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.rolemenu_rolemenuid_seq;
       public          postgres    false    269            x           0    0    rolemenu_rolemenuid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.rolemenu_rolemenuid_seq OWNED BY public.rolemenu.rolemenuid;
          public          postgres    false    270                       1259    17131    shift    TABLE     O  CREATE TABLE public.shift (
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
       public         heap    postgres    false                       1259    17134    shift_shiftid_seq    SEQUENCE     �   CREATE SEQUENCE public.shift_shiftid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.shift_shiftid_seq;
       public          postgres    false    271            y           0    0    shift_shiftid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.shift_shiftid_seq OWNED BY public.shift.shiftid;
          public          postgres    false    272                       1259    17135    shiftdetail    TABLE       CREATE TABLE public.shiftdetail (
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
       public         heap    postgres    false                       1259    17138    shiftdetail_shiftdetailid_seq    SEQUENCE     �   CREATE SEQUENCE public.shiftdetail_shiftdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.shiftdetail_shiftdetailid_seq;
       public          postgres    false    273            z           0    0    shiftdetail_shiftdetailid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.shiftdetail_shiftdetailid_seq OWNED BY public.shiftdetail.shiftdetailid;
          public          postgres    false    274                       1259    17139    shiftdetailregion    TABLE     �   CREATE TABLE public.shiftdetailregion (
    shiftdetailregionid integer NOT NULL,
    shiftdetailid integer NOT NULL,
    regionid integer NOT NULL,
    isdeleted boolean
);
 %   DROP TABLE public.shiftdetailregion;
       public         heap    postgres    false                       1259    17142 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq;
       public          postgres    false    275            {           0    0 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq OWNED BY public.shiftdetailregion.shiftdetailregionid;
          public          postgres    false    276                       1259    17143    smslog    TABLE     �  CREATE TABLE public.smslog (
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
       public         heap    postgres    false                       1259    17148    users    TABLE     +  CREATE TABLE public.users (
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
       public         heap    postgres    false                       1259    17153    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    278            |           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    279            �           2604    17462    EncounterForm EncounterFormId    DEFAULT     �   ALTER TABLE ONLY public."EncounterForm" ALTER COLUMN "EncounterFormId" SET DEFAULT nextval('public."EncounterForm_EncounterFormId_seq"'::regclass);
 P   ALTER TABLE public."EncounterForm" ALTER COLUMN "EncounterFormId" DROP DEFAULT;
       public          postgres    false    216    215            �           2604    17463    admin adminid    DEFAULT     n   ALTER TABLE ONLY public.admin ALTER COLUMN adminid SET DEFAULT nextval('public.admin_adminid_seq'::regclass);
 <   ALTER TABLE public.admin ALTER COLUMN adminid DROP DEFAULT;
       public          postgres    false    218    217            �           2604    17464    adminregion adminregionid    DEFAULT     �   ALTER TABLE ONLY public.adminregion ALTER COLUMN adminregionid SET DEFAULT nextval('public.adminregion_adminregionid_seq'::regclass);
 H   ALTER TABLE public.adminregion ALTER COLUMN adminregionid DROP DEFAULT;
       public          postgres    false    220    219            �           2604    17465    blockrequests blockrequestid    DEFAULT     �   ALTER TABLE ONLY public.blockrequests ALTER COLUMN blockrequestid SET DEFAULT nextval('public.blockrequests_blockrequestid_seq'::regclass);
 K   ALTER TABLE public.blockrequests ALTER COLUMN blockrequestid DROP DEFAULT;
       public          postgres    false    225    224            �           2604    17466    business businessid    DEFAULT     z   ALTER TABLE ONLY public.business ALTER COLUMN businessid SET DEFAULT nextval('public.business_businessid_seq'::regclass);
 B   ALTER TABLE public.business ALTER COLUMN businessid DROP DEFAULT;
       public          postgres    false    227    226            �           2604    17467    concierge conciergeid    DEFAULT     ~   ALTER TABLE ONLY public.concierge ALTER COLUMN conciergeid SET DEFAULT nextval('public.concierge_conciergeid_seq'::regclass);
 D   ALTER TABLE public.concierge ALTER COLUMN conciergeid DROP DEFAULT;
       public          postgres    false    230    229            �           2604    17468    healthprofessionals vendorid    DEFAULT     �   ALTER TABLE ONLY public.healthprofessionals ALTER COLUMN vendorid SET DEFAULT nextval('public.healthprofessionals_vendorid_seq'::regclass);
 K   ALTER TABLE public.healthprofessionals ALTER COLUMN vendorid DROP DEFAULT;
       public          postgres    false    233    232                        2604    17469 +   healthprofessionaltype healthprofessionalid    DEFAULT     �   ALTER TABLE ONLY public.healthprofessionaltype ALTER COLUMN healthprofessionalid SET DEFAULT nextval('public.healthprofessionaltype_healthprofessionalid_seq'::regclass);
 Z   ALTER TABLE public.healthprofessionaltype ALTER COLUMN healthprofessionalid DROP DEFAULT;
       public          postgres    false    235    234                       2604    17470    menu menuid    DEFAULT     j   ALTER TABLE ONLY public.menu ALTER COLUMN menuid SET DEFAULT nextval('public.menu_menuid_seq'::regclass);
 :   ALTER TABLE public.menu ALTER COLUMN menuid DROP DEFAULT;
       public          postgres    false    237    236                       2604    17471    orderdetails id    DEFAULT     r   ALTER TABLE ONLY public.orderdetails ALTER COLUMN id SET DEFAULT nextval('public.orderdetails_id_seq'::regclass);
 >   ALTER TABLE public.orderdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238                       2604    17472    physician physicianid    DEFAULT     ~   ALTER TABLE ONLY public.physician ALTER COLUMN physicianid SET DEFAULT nextval('public.physician_physicianid_seq'::regclass);
 D   ALTER TABLE public.physician ALTER COLUMN physicianid DROP DEFAULT;
       public          postgres    false    241    240                       2604    17473    physiciannotification id    DEFAULT     �   ALTER TABLE ONLY public.physiciannotification ALTER COLUMN id SET DEFAULT nextval('public.physiciannotification_id_seq'::regclass);
 G   ALTER TABLE public.physiciannotification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243                       2604    17474 !   physicianregion physicianregionid    DEFAULT     �   ALTER TABLE ONLY public.physicianregion ALTER COLUMN physicianregionid SET DEFAULT nextval('public.physicianregion_physicianregionid_seq'::regclass);
 P   ALTER TABLE public.physicianregion ALTER COLUMN physicianregionid DROP DEFAULT;
       public          postgres    false    246    245                       2604    17475    region regionid    DEFAULT     r   ALTER TABLE ONLY public.region ALTER COLUMN regionid SET DEFAULT nextval('public.region_regionid_seq'::regclass);
 >   ALTER TABLE public.region ALTER COLUMN regionid DROP DEFAULT;
       public          postgres    false    248    247                       2604    17476    request requestid    DEFAULT     v   ALTER TABLE ONLY public.request ALTER COLUMN requestid SET DEFAULT nextval('public.request_requestid_seq'::regclass);
 @   ALTER TABLE public.request ALTER COLUMN requestid DROP DEFAULT;
       public          postgres    false    250    249            	           2604    17477 !   requestbusiness requestbusinessid    DEFAULT     �   ALTER TABLE ONLY public.requestbusiness ALTER COLUMN requestbusinessid SET DEFAULT nextval('public.requestbusiness_requestbusinessid_seq'::regclass);
 P   ALTER TABLE public.requestbusiness ALTER COLUMN requestbusinessid DROP DEFAULT;
       public          postgres    false    252    251            
           2604    17478    requestclient requestclientid    DEFAULT     �   ALTER TABLE ONLY public.requestclient ALTER COLUMN requestclientid SET DEFAULT nextval('public.requestclient_requestclientid_seq'::regclass);
 L   ALTER TABLE public.requestclient ALTER COLUMN requestclientid DROP DEFAULT;
       public          postgres    false    254    253                       2604    17479    requestclosed requestclosedid    DEFAULT     �   ALTER TABLE ONLY public.requestclosed ALTER COLUMN requestclosedid SET DEFAULT nextval('public.requestclosed_requestclosedid_seq'::regclass);
 L   ALTER TABLE public.requestclosed ALTER COLUMN requestclosedid DROP DEFAULT;
       public          postgres    false    256    255                       2604    17480    requestconcierge id    DEFAULT     z   ALTER TABLE ONLY public.requestconcierge ALTER COLUMN id SET DEFAULT nextval('public.requestconcierge_id_seq'::regclass);
 B   ALTER TABLE public.requestconcierge ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257                       2604    17481    requestnotes requestnotesid    DEFAULT     �   ALTER TABLE ONLY public.requestnotes ALTER COLUMN requestnotesid SET DEFAULT nextval('public.requestnotes_requestnotesid_seq'::regclass);
 J   ALTER TABLE public.requestnotes ALTER COLUMN requestnotesid DROP DEFAULT;
       public          postgres    false    260    259                       2604    17482 #   requeststatuslog requeststatuslogid    DEFAULT     �   ALTER TABLE ONLY public.requeststatuslog ALTER COLUMN requeststatuslogid SET DEFAULT nextval('public.requeststatuslog_requeststatuslogid_seq'::regclass);
 R   ALTER TABLE public.requeststatuslog ALTER COLUMN requeststatuslogid DROP DEFAULT;
       public          postgres    false    262    261                       2604    17483    requesttype requesttypeid    DEFAULT     �   ALTER TABLE ONLY public.requesttype ALTER COLUMN requesttypeid SET DEFAULT nextval('public.requesttype_requesttypeid_seq'::regclass);
 H   ALTER TABLE public.requesttype ALTER COLUMN requesttypeid DROP DEFAULT;
       public          postgres    false    264    263                       2604    17484 !   requestwisefile requestwisefileid    DEFAULT     �   ALTER TABLE ONLY public.requestwisefile ALTER COLUMN requestwisefileid SET DEFAULT nextval('public.requestwisefile_requestwisefileid_seq'::regclass);
 P   ALTER TABLE public.requestwisefile ALTER COLUMN requestwisefileid DROP DEFAULT;
       public          postgres    false    266    265                       2604    17485    role roleid    DEFAULT     j   ALTER TABLE ONLY public.role ALTER COLUMN roleid SET DEFAULT nextval('public.role_roleid_seq'::regclass);
 :   ALTER TABLE public.role ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    268    267                       2604    17486    rolemenu rolemenuid    DEFAULT     z   ALTER TABLE ONLY public.rolemenu ALTER COLUMN rolemenuid SET DEFAULT nextval('public.rolemenu_rolemenuid_seq'::regclass);
 B   ALTER TABLE public.rolemenu ALTER COLUMN rolemenuid DROP DEFAULT;
       public          postgres    false    270    269                       2604    17487    shift shiftid    DEFAULT     n   ALTER TABLE ONLY public.shift ALTER COLUMN shiftid SET DEFAULT nextval('public.shift_shiftid_seq'::regclass);
 <   ALTER TABLE public.shift ALTER COLUMN shiftid DROP DEFAULT;
       public          postgres    false    272    271                       2604    17488    shiftdetail shiftdetailid    DEFAULT     �   ALTER TABLE ONLY public.shiftdetail ALTER COLUMN shiftdetailid SET DEFAULT nextval('public.shiftdetail_shiftdetailid_seq'::regclass);
 H   ALTER TABLE public.shiftdetail ALTER COLUMN shiftdetailid DROP DEFAULT;
       public          postgres    false    274    273                       2604    17489 %   shiftdetailregion shiftdetailregionid    DEFAULT     �   ALTER TABLE ONLY public.shiftdetailregion ALTER COLUMN shiftdetailregionid SET DEFAULT nextval('public.shiftdetailregion_shiftdetailregionid_seq'::regclass);
 T   ALTER TABLE public.shiftdetailregion ALTER COLUMN shiftdetailregionid DROP DEFAULT;
       public          postgres    false    276    275                       2604    17490    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    279    278                      0    16974    EncounterForm 
   TABLE DATA           �  COPY public."EncounterForm" ("EncounterFormId", requestid, "HistoryOfPresentIllnessOrInjury", "MedicalHistory", "Medications", "Allergies", "Temp", "HR", "RR", "BloodPressureSystolic", "BloodPressureDiastolic", "O2", "Pain", "Heent", "CV", "Chest", "ABD", "Extremeties", "Skin", "Neuro", "Other", "Diagnosis", "TreatmentPlan", "MedicationsDispensed", "Procedures", "FollowUp", "AdminId", "PhysicianId", "IsFinalize") FROM stdin;
    public          postgres    false    215   �{                0    16981    admin 
   TABLE DATA           �   COPY public.admin (adminid, aspnetuserid, firstname, lastname, email, mobile, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, isdeleted, roleid) FROM stdin;
    public          postgres    false    217   |                0    16987    adminregion 
   TABLE DATA           G   COPY public.adminregion (adminregionid, adminid, regionid) FROM stdin;
    public          postgres    false    219   �|                0    16991    aspnetroles 
   TABLE DATA           /   COPY public.aspnetroles (id, name) FROM stdin;
    public          postgres    false    221   �|                 0    16994    aspnetuserroles 
   TABLE DATA           9   COPY public.aspnetuserroles (userid, roleid) FROM stdin;
    public          postgres    false    222   }      !          0    16997    aspnetusers 
   TABLE DATA           t   COPY public.aspnetusers (id, username, passwordhash, email, phonenumber, ip, createddate, modifieddate) FROM stdin;
    public          postgres    false    223   �}      "          0    17002    blockrequests 
   TABLE DATA           �   COPY public.blockrequests (blockrequestid, phonenumber, email, isactive, reason, requestid, ip, createddate, modifieddate) FROM stdin;
    public          postgres    false    224   �      $          0    17008    business 
   TABLE DATA           �   COPY public.business (businessid, name, address1, address2, city, regionid, zipcode, phonenumber, faxnumber, isregistered, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip) FROM stdin;
    public          postgres    false    226   1�      &          0    17014    casetag 
   TABLE DATA           2   COPY public.casetag (casetagid, name) FROM stdin;
    public          postgres    false    228   N�      '          0    17017 	   concierge 
   TABLE DATA           �   COPY public.concierge (conciergeid, conciergename, address, street, city, state, zipcode, createddate, regionid, roleid) FROM stdin;
    public          postgres    false    229   �      )          0    17021    emaillog 
   TABLE DATA           �   COPY public.emaillog (emaillogid, emailtemplate, subjectname, emailid, confirmationnumber, filepath, roleid, requestid, adminid, physicianid, createdate, sentdate, isemailsent, senttries, action) FROM stdin;
    public          postgres    false    231   
�      *          0    17026    healthprofessionals 
   TABLE DATA           �   COPY public.healthprofessionals (vendorid, vendorname, profession, faxnumber, address, city, state, zip, regionid, createddate, modifieddate, phonenumber, isdeleted, ip, email, businesscontact) FROM stdin;
    public          postgres    false    232   '�      ,          0    17032    healthprofessionaltype 
   TABLE DATA           x   COPY public.healthprofessionaltype (healthprofessionalid, professionname, createddate, isactive, isdeleted) FROM stdin;
    public          postgres    false    234   ׁ      .          0    17036    menu 
   TABLE DATA           D   COPY public.menu (menuid, name, accounttype, sortorder) FROM stdin;
    public          postgres    false    236   �      0          0    17041    orderdetails 
   TABLE DATA           �   COPY public.orderdetails (id, vendorid, requestid, faxnumber, email, businesscontact, prescription, noofrefill, createddate, createdby) FROM stdin;
    public          postgres    false    238   ;�      2          0    17047 	   physician 
   TABLE DATA           �  COPY public.physician (physicianid, aspnetuserid, firstname, lastname, email, mobile, medicallicense, photo, adminnotes, isagreementdoc, isbackgrounddoc, istrainingdoc, isnondisclosuredoc, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, businessname, businesswebsite, isdeleted, roleid, npinumber, islicensedoc, signature, iscredentialdoc, istokengenerate, syncemailaddress) FROM stdin;
    public          postgres    false    240   �      4          0    17053    physicianlocation 
   TABLE DATA           ~   COPY public.physicianlocation (locationid, physicianid, latitude, longitude, createddate, physicianname, address) FROM stdin;
    public          postgres    false    242   $�      5          0    17058    physiciannotification 
   TABLE DATA           W   COPY public.physiciannotification (id, physicianid, isnotificationstopped) FROM stdin;
    public          postgres    false    243   A�      7          0    17062    physicianregion 
   TABLE DATA           S   COPY public.physicianregion (physicianregionid, physicianid, regionid) FROM stdin;
    public          postgres    false    245   ^�      9          0    17066    region 
   TABLE DATA           >   COPY public.region (regionid, name, abbreviation) FROM stdin;
    public          postgres    false    247   ��      ;          0    17070    request 
   TABLE DATA           �  COPY public.request (requestid, requesttypeid, userid, firstname, lastname, phonenumber, email, status, physicianid, confirmationnumber, createddate, isdeleted, modifieddate, declinedby, isurgentemailsent, lastwellnessdate, ismobile, calltype, completedbyphysician, lastreservationdate, accepteddate, relationname, casenumber, ip, casetag, casetagphysician, patientaccountid, createduserid) FROM stdin;
    public          postgres    false    249   �      =          0    17079    requestbusiness 
   TABLE DATA           W   COPY public.requestbusiness (requestbusinessid, requestid, businessid, ip) FROM stdin;
    public          postgres    false    251   ц      ?          0    17083    requestclient 
   TABLE DATA           s  COPY public.requestclient (requestclientid, requestid, firstname, lastname, phonenumber, location, address, regionid, notimobile, notiemail, notes, email, strmonth, intyear, intdate, ismobile, street, city, state, zipcode, communicationtype, remindreservationcount, remindhousecallcount, issetfollowupsent, ip, isreservationremindersent, latitude, longitude) FROM stdin;
    public          postgres    false    253   �      A          0    17089    requestclosed 
   TABLE DATA           r   COPY public.requestclosed (requestclosedid, requestid, requeststatuslogid, phynotes, clientnotes, ip) FROM stdin;
    public          postgres    false    255   1�      C          0    17095    requestconcierge 
   TABLE DATA           J   COPY public.requestconcierge (id, requestid, conciergeid, ip) FROM stdin;
    public          postgres    false    257   Z�      E          0    17099    requestnotes 
   TABLE DATA           �   COPY public.requestnotes (requestnotesid, requestid, strmonth, intyear, intdate, physiciannotes, adminnotes, createdby, createddate, modifiedby, modifieddate, ip, administrativenotes) FROM stdin;
    public          postgres    false    259   w�      G          0    17105    requeststatuslog 
   TABLE DATA           �   COPY public.requeststatuslog (requeststatuslogid, requestid, status, physicianid, adminid, transtophysicianid, notes, createddate, ip, transtoadmin) FROM stdin;
    public          postgres    false    261   ,�      I          0    17111    requesttype 
   TABLE DATA           :   COPY public.requesttype (requesttypeid, name) FROM stdin;
    public          postgres    false    263   8�      K          0    17115    requestwisefile 
   TABLE DATA           �   COPY public.requestwisefile (requestwisefileid, requestid, filename, createddate, physicianid, adminid, doctype, isfrontside, iscompensation, ip, isfinalize, isdeleted, ispatientrecords) FROM stdin;
    public          postgres    false    265   U�      M          0    17122    role 
   TABLE DATA           z   COPY public.role (roleid, name, accounttype, createdby, createddate, modifiedby, modifieddate, isdeleted, ip) FROM stdin;
    public          postgres    false    267   ��      O          0    17127    rolemenu 
   TABLE DATA           >   COPY public.rolemenu (rolemenuid, roleid, menuid) FROM stdin;
    public          postgres    false    269   ��      Q          0    17131    shift 
   TABLE DATA           |   COPY public.shift (shiftid, physicianid, startdate, isrepeat, weekdays, repeatupto, createdby, createddate, ip) FROM stdin;
    public          postgres    false    271   Ҏ      S          0    17135    shiftdetail 
   TABLE DATA           �   COPY public.shiftdetail (shiftdetailid, shiftid, shiftdate, regionid, starttime, endtime, status, isdeleted, modifiedby, modifieddate, lastrunningdate, eventid, issync) FROM stdin;
    public          postgres    false    273   �      U          0    17139    shiftdetailregion 
   TABLE DATA           d   COPY public.shiftdetailregion (shiftdetailregionid, shiftdetailid, regionid, isdeleted) FROM stdin;
    public          postgres    false    275   �      W          0    17143    smslog 
   TABLE DATA           �   COPY public.smslog (smslogid, smstemplate, mobilenumber, confirmationnumber, roleid, adminid, requestid, physicianid, createdate, sentdate, issmssent, senttries, action) FROM stdin;
    public          postgres    false    277   )�      X          0    17148    users 
   TABLE DATA             COPY public.users (userid, aspnetuserid, firstname, lastname, email, mobile, ismobile, street, city, state, regionid, zipcode, strmonth, intyear, intdate, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip, isrequestwithemail) FROM stdin;
    public          postgres    false    278   F�      }           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."EncounterForm_EncounterFormId_seq"', 3, true);
          public          postgres    false    216            ~           0    0    admin_adminid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.admin_adminid_seq', 1, true);
          public          postgres    false    218                       0    0    adminregion_adminregionid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.adminregion_adminregionid_seq', 13, true);
          public          postgres    false    220            �           0    0     blockrequests_blockrequestid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.blockrequests_blockrequestid_seq', 1, true);
          public          postgres    false    225            �           0    0    business_businessid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.business_businessid_seq', 1, false);
          public          postgres    false    227            �           0    0    concierge_conciergeid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.concierge_conciergeid_seq', 1, false);
          public          postgres    false    230            �           0    0     healthprofessionals_vendorid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.healthprofessionals_vendorid_seq', 3, true);
          public          postgres    false    233            �           0    0 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.healthprofessionaltype_healthprofessionalid_seq', 2, true);
          public          postgres    false    235            �           0    0    menu_menuid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.menu_menuid_seq', 1, false);
          public          postgres    false    237            �           0    0    orderdetails_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orderdetails_id_seq', 3, true);
          public          postgres    false    239            �           0    0    physician_physicianid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.physician_physicianid_seq', 1, true);
          public          postgres    false    241            �           0    0    physiciannotification_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.physiciannotification_id_seq', 1, false);
          public          postgres    false    244            �           0    0 %   physicianregion_physicianregionid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.physicianregion_physicianregionid_seq', 4, true);
          public          postgres    false    246            �           0    0    region_regionid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.region_regionid_seq', 1, true);
          public          postgres    false    248            �           0    0    request_requestid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.request_requestid_seq', 96, true);
          public          postgres    false    250            �           0    0 %   requestbusiness_requestbusinessid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.requestbusiness_requestbusinessid_seq', 1, false);
          public          postgres    false    252            �           0    0 !   requestclient_requestclientid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.requestclient_requestclientid_seq', 89, true);
          public          postgres    false    254            �           0    0 !   requestclosed_requestclosedid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.requestclosed_requestclosedid_seq', 5, true);
          public          postgres    false    256            �           0    0    requestconcierge_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.requestconcierge_id_seq', 1, false);
          public          postgres    false    258            �           0    0    requestnotes_requestnotesid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.requestnotes_requestnotesid_seq', 13, true);
          public          postgres    false    260            �           0    0 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.requeststatuslog_requeststatuslogid_seq', 28, true);
          public          postgres    false    262            �           0    0    requesttype_requesttypeid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.requesttype_requesttypeid_seq', 1, false);
          public          postgres    false    264            �           0    0 %   requestwisefile_requestwisefileid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.requestwisefile_requestwisefileid_seq', 50, true);
          public          postgres    false    266            �           0    0    role_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.role_roleid_seq', 1, false);
          public          postgres    false    268            �           0    0    rolemenu_rolemenuid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.rolemenu_rolemenuid_seq', 1, false);
          public          postgres    false    270            �           0    0    shift_shiftid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.shift_shiftid_seq', 1, false);
          public          postgres    false    272            �           0    0    shiftdetail_shiftdetailid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.shiftdetail_shiftdetailid_seq', 1, false);
          public          postgres    false    274            �           0    0 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.shiftdetailregion_shiftdetailregionid_seq', 1, false);
          public          postgres    false    276            �           0    0    users_userid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_userid_seq', 19, true);
          public          postgres    false    279                       2606    17184     EncounterForm EncounterForm_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_pkey" PRIMARY KEY ("EncounterFormId");
 N   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_pkey";
       public            postgres    false    215                       2606    17186    admin admin_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (adminid);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    217            !           2606    17188    adminregion adminregion_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_pkey PRIMARY KEY (adminregionid);
 F   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_pkey;
       public            postgres    false    219            #           2606    17190    aspnetroles aspnetroles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.aspnetroles
    ADD CONSTRAINT aspnetroles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.aspnetroles DROP CONSTRAINT aspnetroles_pkey;
       public            postgres    false    221            %           2606    17192 $   aspnetuserroles aspnetuserroles_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_pkey PRIMARY KEY (userid, roleid);
 N   ALTER TABLE ONLY public.aspnetuserroles DROP CONSTRAINT aspnetuserroles_pkey;
       public            postgres    false    222    222            '           2606    17194    aspnetusers aspnetusers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.aspnetusers
    ADD CONSTRAINT aspnetusers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.aspnetusers DROP CONSTRAINT aspnetusers_pkey;
       public            postgres    false    223            )           2606    17196     blockrequests blockrequests_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.blockrequests
    ADD CONSTRAINT blockrequests_pkey PRIMARY KEY (blockrequestid);
 J   ALTER TABLE ONLY public.blockrequests DROP CONSTRAINT blockrequests_pkey;
       public            postgres    false    224            +           2606    17198    business business_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (businessid);
 @   ALTER TABLE ONLY public.business DROP CONSTRAINT business_pkey;
       public            postgres    false    226            -           2606    17200    concierge concierge_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_pkey PRIMARY KEY (conciergeid);
 B   ALTER TABLE ONLY public.concierge DROP CONSTRAINT concierge_pkey;
       public            postgres    false    229            /           2606    17202    emaillog emaillog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.emaillog
    ADD CONSTRAINT emaillog_pkey PRIMARY KEY (emaillogid);
 @   ALTER TABLE ONLY public.emaillog DROP CONSTRAINT emaillog_pkey;
       public            postgres    false    231            1           2606    17204 ,   healthprofessionals healthprofessionals_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_pkey PRIMARY KEY (vendorid);
 V   ALTER TABLE ONLY public.healthprofessionals DROP CONSTRAINT healthprofessionals_pkey;
       public            postgres    false    232            3           2606    17206 2   healthprofessionaltype healthprofessionaltype_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.healthprofessionaltype
    ADD CONSTRAINT healthprofessionaltype_pkey PRIMARY KEY (healthprofessionalid);
 \   ALTER TABLE ONLY public.healthprofessionaltype DROP CONSTRAINT healthprofessionaltype_pkey;
       public            postgres    false    234            5           2606    17208    menu menu_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menuid);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public            postgres    false    236            7           2606    17210    orderdetails orderdetails_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_pkey;
       public            postgres    false    238            9           2606    17212    physician physician_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_pkey PRIMARY KEY (physicianid);
 B   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_pkey;
       public            postgres    false    240            ;           2606    17214 0   physiciannotification physiciannotification_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.physiciannotification DROP CONSTRAINT physiciannotification_pkey;
       public            postgres    false    243            =           2606    17216 $   physicianregion physicianregion_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_pkey PRIMARY KEY (physicianregionid);
 N   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_pkey;
       public            postgres    false    245            ?           2606    17218    region region_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (regionid);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public            postgres    false    247            A           2606    17220    request request_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (requestid);
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public            postgres    false    249            C           2606    17222 $   requestbusiness requestbusiness_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_pkey PRIMARY KEY (requestbusinessid);
 N   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_pkey;
       public            postgres    false    251            E           2606    17224     requestclient requestclient_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_pkey PRIMARY KEY (requestclientid);
 J   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_pkey;
       public            postgres    false    253            G           2606    17226     requestclosed requestclosed_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_pkey PRIMARY KEY (requestclosedid);
 J   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_pkey;
       public            postgres    false    255            I           2606    17228 &   requestconcierge requestconcierge_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_pkey;
       public            postgres    false    257            K           2606    17230    requestnotes requestnotes_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_pkey PRIMARY KEY (requestnotesid);
 H   ALTER TABLE ONLY public.requestnotes DROP CONSTRAINT requestnotes_pkey;
       public            postgres    false    259            M           2606    17232 &   requeststatuslog requeststatuslog_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_pkey PRIMARY KEY (requeststatuslogid);
 P   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_pkey;
       public            postgres    false    261            O           2606    17234    requesttype requesttype_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.requesttype
    ADD CONSTRAINT requesttype_pkey PRIMARY KEY (requesttypeid);
 F   ALTER TABLE ONLY public.requesttype DROP CONSTRAINT requesttype_pkey;
       public            postgres    false    263            Q           2606    17236 $   requestwisefile requestwisefile_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_pkey PRIMARY KEY (requestwisefileid);
 N   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_pkey;
       public            postgres    false    265            S           2606    17238    role role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (roleid);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    267            U           2606    17240    rolemenu rolemenu_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_pkey PRIMARY KEY (rolemenuid);
 @   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_pkey;
       public            postgres    false    269            W           2606    17242    shift shift_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_pkey PRIMARY KEY (shiftid);
 :   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_pkey;
       public            postgres    false    271            Y           2606    17244    shiftdetail shiftdetail_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_pkey PRIMARY KEY (shiftdetailid);
 F   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_pkey;
       public            postgres    false    273            [           2606    17246 (   shiftdetailregion shiftdetailregion_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_pkey PRIMARY KEY (shiftdetailregionid);
 R   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_pkey;
       public            postgres    false    275            ]           2606    17248    smslog smslog_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.smslog
    ADD CONSTRAINT smslog_pkey PRIMARY KEY (smslogid);
 <   ALTER TABLE ONLY public.smslog DROP CONSTRAINT smslog_pkey;
       public            postgres    false    277            _           2606    17250    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    278            `           2606    17251 (   EncounterForm EncounterForm_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public.admin(adminid);
 V   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_AdminId_fkey";
       public          postgres    false    4895    215    217            a           2606    17256 ,   EncounterForm EncounterForm_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_PhysicianId_fkey";
       public          postgres    false    215    240    4921            b           2606    17261 *   EncounterForm EncounterForm_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_requestid_fkey" FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_requestid_fkey";
       public          postgres    false    4929    249    215            c           2606    17266    admin admin_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 G   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_aspnetuserid_fkey;
       public          postgres    false    217    223    4903            d           2606    17271 $   adminregion adminregion_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 N   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_adminid_fkey;
       public          postgres    false    219    4895    217            e           2606    17276 %   adminregion adminregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 O   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_regionid_fkey;
       public          postgres    false    4927    247    219            f           2606    17281 +   aspnetuserroles aspnetuserroles_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_userid_fkey FOREIGN KEY (userid) REFERENCES public.aspnetusers(id);
 U   ALTER TABLE ONLY public.aspnetuserroles DROP CONSTRAINT aspnetuserroles_userid_fkey;
       public          postgres    false    223    4903    222            g           2606    17286    business business_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 I   ALTER TABLE ONLY public.business DROP CONSTRAINT business_regionid_fkey;
       public          postgres    false    226    247    4927            h           2606    17291 !   concierge concierge_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 K   ALTER TABLE ONLY public.concierge DROP CONSTRAINT concierge_regionid_fkey;
       public          postgres    false    4927    247    229            i           2606    17296 7   healthprofessionals healthprofessionals_profession_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_profession_fkey FOREIGN KEY (profession) REFERENCES public.healthprofessionaltype(healthprofessionalid);
 a   ALTER TABLE ONLY public.healthprofessionals DROP CONSTRAINT healthprofessionals_profession_fkey;
       public          postgres    false    232    234    4915            j           2606    17301 %   physician physician_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 O   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_aspnetuserid_fkey;
       public          postgres    false    4903    240    223            k           2606    17306 4   physicianlocation physicianlocation_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianlocation
    ADD CONSTRAINT physicianlocation_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 ^   ALTER TABLE ONLY public.physicianlocation DROP CONSTRAINT physicianlocation_physicianid_fkey;
       public          postgres    false    4921    242    240            l           2606    17311 <   physiciannotification physiciannotification_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 f   ALTER TABLE ONLY public.physiciannotification DROP CONSTRAINT physiciannotification_physicianid_fkey;
       public          postgres    false    4921    243    240            m           2606    17316 0   physicianregion physicianregion_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_physicianid_fkey;
       public          postgres    false    240    4921    245            n           2606    17321 -   physicianregion physicianregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 W   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_regionid_fkey;
       public          postgres    false    4927    245    247            o           2606    17326     request request_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 J   ALTER TABLE ONLY public.request DROP CONSTRAINT request_physicianid_fkey;
       public          postgres    false    249    4921    240            p           2606    17331    request request_userid_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);
 E   ALTER TABLE ONLY public.request DROP CONSTRAINT request_userid_fkey;
       public          postgres    false    249    278    4959            q           2606    17336 /   requestbusiness requestbusiness_businessid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_businessid_fkey FOREIGN KEY (businessid) REFERENCES public.business(businessid);
 Y   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_businessid_fkey;
       public          postgres    false    251    226    4907            r           2606    17341 .   requestbusiness requestbusiness_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_requestid_fkey;
       public          postgres    false    251    4929    249            s           2606    17346 )   requestclient requestclient_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 S   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_regionid_fkey;
       public          postgres    false    253    4927    247            t           2606    17351 *   requestclient requestclient_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 T   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_requestid_fkey;
       public          postgres    false    253    4929    249            u           2606    17356 *   requestclosed requestclosed_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 T   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_requestid_fkey;
       public          postgres    false    255    4929    249            v           2606    17361 3   requestclosed requestclosed_requeststatuslogid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requeststatuslogid_fkey FOREIGN KEY (requeststatuslogid) REFERENCES public.requeststatuslog(requeststatuslogid);
 ]   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_requeststatuslogid_fkey;
       public          postgres    false    261    4941    255            w           2606    17366 2   requestconcierge requestconcierge_conciergeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_conciergeid_fkey FOREIGN KEY (conciergeid) REFERENCES public.concierge(conciergeid);
 \   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_conciergeid_fkey;
       public          postgres    false    4909    257    229            x           2606    17371 0   requestconcierge requestconcierge_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 Z   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_requestid_fkey;
       public          postgres    false    257    4929    249            y           2606    17376 (   requestnotes requestnotes_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 R   ALTER TABLE ONLY public.requestnotes DROP CONSTRAINT requestnotes_requestid_fkey;
       public          postgres    false    249    259    4929            z           2606    17381 .   requeststatuslog requeststatuslog_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 X   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_adminid_fkey;
       public          postgres    false    4895    261    217            {           2606    17386 2   requeststatuslog requeststatuslog_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 \   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_physicianid_fkey;
       public          postgres    false    240    4921    261            |           2606    17391 0   requeststatuslog requeststatuslog_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 Z   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_requestid_fkey;
       public          postgres    false    261    249    4929            }           2606    17396 9   requeststatuslog requeststatuslog_transtophysicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_transtophysicianid_fkey FOREIGN KEY (transtophysicianid) REFERENCES public.physician(physicianid);
 c   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_transtophysicianid_fkey;
       public          postgres    false    240    4921    261            ~           2606    17401 ,   requestwisefile requestwisefile_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 V   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_adminid_fkey;
       public          postgres    false    4895    217    265                       2606    17406 0   requestwisefile requestwisefile_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_physicianid_fkey;
       public          postgres    false    4921    265    240            �           2606    17411 .   requestwisefile requestwisefile_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_requestid_fkey;
       public          postgres    false    4929    265    249            �           2606    17416    rolemenu rolemenu_menuid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_menuid_fkey FOREIGN KEY (menuid) REFERENCES public.menu(menuid);
 G   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_menuid_fkey;
       public          postgres    false    269    236    4917            �           2606    17421    rolemenu rolemenu_roleid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.role(roleid);
 G   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_roleid_fkey;
       public          postgres    false    4947    267    269            �           2606    17426    shift shift_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.aspnetusers(id);
 D   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_createdby_fkey;
       public          postgres    false    4903    223    271            �           2606    17431    shift shift_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 F   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_physicianid_fkey;
       public          postgres    false    271    240    4921            �           2606    17436 '   shiftdetail shiftdetail_modifiedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_modifiedby_fkey FOREIGN KEY (modifiedby) REFERENCES public.aspnetusers(id);
 Q   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_modifiedby_fkey;
       public          postgres    false    223    273    4903            �           2606    17441 $   shiftdetail shiftdetail_shiftid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_shiftid_fkey FOREIGN KEY (shiftid) REFERENCES public.shift(shiftid);
 N   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_shiftid_fkey;
       public          postgres    false    271    273    4951            �           2606    17446 1   shiftdetailregion shiftdetailregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 [   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_regionid_fkey;
       public          postgres    false    275    247    4927            �           2606    17451 6   shiftdetailregion shiftdetailregion_shiftdetailid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_shiftdetailid_fkey FOREIGN KEY (shiftdetailid) REFERENCES public.shiftdetail(shiftdetailid);
 `   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_shiftdetailid_fkey;
       public          postgres    false    275    4953    273            �           2606    17456    users users_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_aspnetuserid_fkey;
       public          postgres    false    278    223    4903               O   x�3�0�L)N�b�?* #�4.cN;%htZ:�r�ҁ֤�4�i)�Y�Bt�@zS�P��g	W� U90s         �   x���;�0k���Z���q�iL�E�D��!%H��k����ƖA�l�����]��u���c[��q�|�Ma�/�E��Fݳ?n}���ղ$7�~k2��e矣 �@VX
� 9g�������/�i?�            x�34�4�4�24R&\1z\\\ �p         5   x�3�tL����2�H,�L�+�2�(�/�LI-�2��M,.I-R������� m�=          �   x�e�9��0D�غZ�Hw��TY} �h�L�3��f�j($�+q��2����f�4?Jrł����%����9ϹV5� �F�5'g&�8�׮
(.&ׁ�������r��ϣ%�k�^�n���N�����K��_o|���rP�r/��Aq���q���J)} ��UC      !   2  x���Qn�0���S�2$��D?�;A_$�^��IQ�ݲ�Or�.Nܮ�`����OZ�E��^ik�BA��SV�\�����f���~w>==���ͧ�ƀ]3{�C���[PiP [C�֝���@%��1�&AE��CN*ʐ
_��!��x9�_��1>���hCD�n�,������]- "��+<*41�@�)�R��yR�?�y������ �u��跚;�����ób'�P@�	N�S�H}�!!���O����Er�]��Z��/�AgSJ��������LC�L:�8[Z�t4����w\�P?�)(;dRȥ�<PT�H�\�
D�"�
�wڴ����eBe�5u�8.l}�?����G��s�� ���(��q]���v�8^��#�eb��L��^��(+l�ۮ���D�>�p���]VǏ���y�+�>�[_�{17���͕�(���n~�w�M�m����g�v��'ku*?���尼%V�)9)���f��kl�4��}���k<�N/��tzx��K��[k���e]��`;c;��8c�f7w�f������      "      x������ � �      $      x������ � �      &   �   x�͎M
�@FדS� "Կ�tc7��M('C��o����㽯���V�0��L9�(:�}�����������`��a(֔��?r��(o����2�q�;R�*U9c\����)LY����s*i^����2t�}����l9      '      x������ � �      )      x������ � �      *   �   x�}�M
�0�דSx%�Ob��۞�MhT�@��׈�vSxo���CX��O����[�����4[�5�.��AuC���sM�����SP� �ŰX#�:t?��=�l�V�J��J0�X�avm������{�F�j��?������ aRu��� �#>t      ,   7   x�3�,(�OK-.���3�4202�50�50W00�#NC�?.#$eF����qqq z9Q      .      x������ � �      0   �   x���M
�0@���^��̟CV=AO�F��B��E�_�.���}/����B�0�ׂ��{<}�� �E��	�>�q���\�CSEML��G16����s�K^�rT��&R�-�i��$^�_0^@ViL1(k��+���!�� ^0(�ɵ�9�G�=>      2   1  x�}�Qn�0����@P��)�i'�}	8i��f��N��PѬR��M�8�l��3�xd�d�^���p�@q�I�2����2�p����ax[�ߏ
��o�^��²�jI��ce������<�6V�um�˸'��wNQD}ŝ縺=�E���m�!�9z�G2�<����,�媄���嘺� o�Šh�)�o�zr��E��h=�V��M�����:����S��x��ȨM��]j�{t���Hƿ�N��N�qb�^�j*W��g7~���X�J8���j�%0��nWUU� �T0      4      x������ � �      5      x������ � �      7       x�3�4�4�2�B.cN �2�B�=... 4�w      9   P   x�3��K-W��/����2��,J���L��2��M,��I�K����2�t�,.)�L.Q�OSp��)�M�sq����� x      ;   �  x���_S1şç�}X&���� ;��:
N���tmw �T�O�M�
Zl�%���sn�5����ܯ��!��P�HKC)wӋ�E� ,��~@İ�RN��(d ��t���^mH��/W>2�p����Q��>j�wk_�E5_�җ8�	2v��ܭ�k�5>u���^.\5�$ѩ�I"��=$awAl ̖	e�t.B
R����[���cTR�8I@��3*�I�&� R]�z��㠘)�e��M��d�I�m� ��&p�`t���vt@%q$�nV�j!�����:qX��9(�>�x�.�yP��A>6!���B��!������n%�3���
��ɴ�~ݎ(.Jk�
9"��:��/�����C�~��Y��4���������{j���z� �[$���ڈ���Z�@��C/p�T�^������ּ���u={�R�Oo�����y�:�v:�G=�c>      =      x������ � �      ?   3  x��T�n�0<��B��C�D���(����[�mRH�V�|}�?`	@p���,�����u_V�[��4�TP
Ͽ�9V<��F��ɪYo��x1 4����5MW��hxjpyV<�\��!�}�
nH���U[��q���*p�n���Q̒���fT���4�;E��N�c��������VaC�LO���-(��T��(9����Aw�!l���y�Q2�N�PuE�V�Z�˜��~��=6�9CB�\��ǉ��a�EN�e	<�V��z�U[�<@�����"��F[;�5�1��n�Q˦1�Z��5���f{�{	�^9zu(ʓ��ղ

BLK�S�B�E�鳫����.�ˬ t
8���Y�8�r�����t��6	�Є� �x�(��p����Jֺ6q��lS�Ik���)�ޣ�s3�Q��D
��nzD�	��� ���hs;�1�S ���T��~�~n�A|	!�gy_��i��x�K��ME��ǩ����r��m�]�B:���lcL}��O_���wP���ᴛ�p�=�W���@|�      A      x�3�0�42�� �=... .:�      C      x������ � �      E   �   x�u�A� �5���-�!z�n�UK�Ԥl���6�&1����@LG�~O����<������x������+�Uؠf 6%cCOE����l�<&���XXmౡ�.k�A��~�@6_���݄�(�2�0���Wn�>x�U`[���NJaA�R��,gn      G   �   x�]�Kr�0D��� *�G�s�����1��J�����C�f�^w
k��[��M]<���!�v�5r��F/�ҁ@9k��H�F�Kp�ƋL�G.����~7e	��Z��
 ���k���9�L�$`@�)�-lT	];�X�6��8�����w}�$�<� �xph6�����z9ů�8//�"��[V!e����'c2C&?�FvÏ�e�V�	�^W7�8�s��v����� �'*2��6񠪪�Q|l      I      x������ � �      K   3  x��U]�7|���Z��VK���!��'������{;��=����lr`��c�"XfTU]�5>�"�B���n��`����s�Nb�#9�{=G���a�#�,�F�#��q��퍳���y��T��f�׀l� ="�)�-�������p��������}x����\�+a�4Z6��3o�H+�E�S��¬�}�܊L���Р�ӈ�����+�^mv��]�J� ��
�����?��{���W�<�h<'��x=w�+b
�%�S`T� P�W`�%�X+&��������i��:����l���r؂uj{�}��ins5�痋8w�Ȫu&�o�w)�P�5p���"�]��շpӷ�~n���wa@]������I�J%I.���Κ�Z����${n��~�Bh�[��r<�e�п×��D��M𰂋4��2T�:��J�b�1K�¶��.���SW��o����mݎ�M�R����Ղ�!d�D�A 3�F�#F
M�^��x8?��epf���"��{�L?P�횞_�2����ܾ�ONV�m�ǭ�"5��>E�~}�V}W/y����՗�+�&y2m��,�ɋD�fiaͪ.�w��j�n}F�z�Z2?���i�����NJ7\Q�˸��骑|
J�[5�A�=	z^3Q�C�k4�L�8j��~]����v-o�s==����HV�쏪��L6�o��I�� �����%U��n^^@=�4Z�Q	�F�~�:����VZ�>���6�&nU?�̋������4�{�?[�
���d(�Q݂o�������4      M      x������ � �      O      x������ � �      Q      x������ � �      S      x������ � �      U      x������ � �      W      x������ � �      X   �  x���˲�0���S���E�2�Y��9;�OC/a�4���(M���aF�X�%�+k-)���x��N"�Dp�eO�'�����^�c3�������SUwg�R�T���'0���m�pi޶s�A�*YP
T4�'�iRm��v�D�=yEKe��e!bP.��;����ʦ&JYץ$xk.y~�|��Hh�#p����p��|��d0L%<��;����ѿ��)J��SjX�P(�B)�A�s6��q�ǿ�R!2����C��`j����F&#���EEfd5�3��;�vJV^y���$�9����D�%�M��d����l3|������8�˴$������\�]�[{�}�x0��sJ��=�^ܖ��C"�gN��ّ12	�T�o�"�R��)�̯6'�0_��s���܍�f�V�~����뎿56��7i���G�Ô��Qem�͍�����R��M]����j����F�I     