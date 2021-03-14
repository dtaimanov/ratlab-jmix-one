--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Debian 12.5-1.pgdg100+1)
-- Dumped by pg_dump version 13.0

-- Started on 2021-03-14 19:45:47 +04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: cuba
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO cuba;

--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: cuba
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 267 (class 1255 OID 36944)
-- Name: newid(); Type: FUNCTION; Schema: public; Owner: cuba
--

CREATE FUNCTION public.newid() RETURNS uuid
    LANGUAGE sql
    AS $$select md5(random()::text || clock_timestamp()::text)::uuid$$;


ALTER FUNCTION public.newid() OWNER TO cuba;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 257 (class 1259 OID 37711)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO cuba;

--
-- TOC entry 256 (class 1259 OID 37706)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO cuba;

--
-- TOC entry 266 (class 1259 OID 37798)
-- Name: persistent_logins; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.persistent_logins (
    series character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp without time zone NOT NULL
);


ALTER TABLE public.persistent_logins OWNER TO cuba;

--
-- TOC entry 202 (class 1259 OID 36945)
-- Name: ratlab_certificate; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_certificate (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    title character varying(255),
    aquired timestamp without time zone NOT NULL,
    code character varying(255) NOT NULL,
    description text,
    owner_id uuid
);


ALTER TABLE public.ratlab_certificate OWNER TO cuba;

--
-- TOC entry 203 (class 1259 OID 36951)
-- Name: ratlab_employee; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_employee (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    home_address_country character varying(255),
    home_address_town character varying(255),
    home_address_field1 character varying(255),
    home_address_latitude double precision,
    home_address_longitude double precision,
    home_address_field2 character varying(255),
    home_address_field3 character varying(255),
    home_address_field4 character varying(255),
    home_address_field5 character varying(255),
    name character varying(255),
    position_ character varying(50) NOT NULL,
    experience integer NOT NULL,
    since timestamp without time zone NOT NULL,
    laboratory_id uuid,
    supervisor_id uuid
);


ALTER TABLE public.ratlab_employee OWNER TO cuba;

--
-- TOC entry 204 (class 1259 OID 36957)
-- Name: ratlab_employee_research_link; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_employee_research_link (
    employee_id uuid NOT NULL,
    research_id uuid NOT NULL
);


ALTER TABLE public.ratlab_employee_research_link OWNER TO cuba;

--
-- TOC entry 205 (class 1259 OID 36960)
-- Name: ratlab_laboratory; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_laboratory (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    address_country character varying(255),
    address_town character varying(255),
    address_field1 character varying(255),
    address_latitude double precision,
    address_longitude double precision,
    address_field2 character varying(255),
    address_field3 character varying(255),
    address_field4 character varying(255),
    address_field5 character varying(255),
    title character varying(255) NOT NULL,
    description character varying(255),
    day_start time without time zone NOT NULL,
    day_end time without time zone,
    code character varying(255) NOT NULL
);


ALTER TABLE public.ratlab_laboratory OWNER TO cuba;

--
-- TOC entry 206 (class 1259 OID 36966)
-- Name: ratlab_misc_resource; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_misc_resource (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255),
    amount numeric(19,2),
    type_ character varying(50) NOT NULL,
    consumable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.ratlab_misc_resource OWNER TO cuba;

--
-- TOC entry 207 (class 1259 OID 36970)
-- Name: ratlab_rat; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_rat (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255),
    color character varying(255),
    checked boolean
);


ALTER TABLE public.ratlab_rat OWNER TO cuba;

--
-- TOC entry 208 (class 1259 OID 36976)
-- Name: ratlab_research; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_research (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    title character varying(255) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    description text,
    state integer
);


ALTER TABLE public.ratlab_research OWNER TO cuba;

--
-- TOC entry 209 (class 1259 OID 36982)
-- Name: ratlab_research_requirement; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_research_requirement (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    research_id uuid NOT NULL,
    mandatory boolean NOT NULL
);


ALTER TABLE public.ratlab_research_requirement OWNER TO cuba;

--
-- TOC entry 210 (class 1259 OID 36985)
-- Name: ratlab_resource_requirement; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_resource_requirement (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    research_id uuid NOT NULL,
    mandatory boolean NOT NULL,
    resource_id uuid NOT NULL,
    provided integer NOT NULL,
    amount integer NOT NULL,
    consume boolean DEFAULT false
);


ALTER TABLE public.ratlab_resource_requirement OWNER TO cuba;

--
-- TOC entry 211 (class 1259 OID 36989)
-- Name: ratlab_subject_requirement; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ratlab_subject_requirement (
    id uuid NOT NULL,
    version integer NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    research_id uuid NOT NULL,
    mandatory boolean NOT NULL,
    subject_id uuid NOT NULL
);


ALTER TABLE public.ratlab_subject_requirement OWNER TO cuba;

--
-- TOC entry 212 (class 1259 OID 36992)
-- Name: report_execution; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.report_execution (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    report_id uuid,
    report_name character varying(255) NOT NULL,
    report_code character varying(255),
    user_id uuid NOT NULL,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone,
    is_success boolean DEFAULT false,
    cancelled boolean DEFAULT false,
    params text,
    error_message text,
    server_id character varying(50),
    output_document_id uuid
);


ALTER TABLE public.report_execution OWNER TO cuba;

--
-- TOC entry 213 (class 1259 OID 37000)
-- Name: report_group; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.report_group (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    title character varying(255) NOT NULL,
    code character varying(255),
    locale_names text,
    sys_tenant_id character varying(255)
);


ALTER TABLE public.report_group OWNER TO cuba;

--
-- TOC entry 214 (class 1259 OID 37007)
-- Name: report_report; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.report_report (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    code character varying(255),
    description character varying(500),
    locale_names text,
    group_id uuid NOT NULL,
    report_type integer,
    default_template_id uuid,
    xml text,
    roles_idx character varying(1000),
    screens_idx character varying(1000),
    input_entity_types_idx character varying(1000),
    rest_access boolean DEFAULT false,
    is_system boolean DEFAULT false,
    sys_tenant_id character varying(255)
);


ALTER TABLE public.report_report OWNER TO cuba;

--
-- TOC entry 215 (class 1259 OID 37016)
-- Name: report_template; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.report_template (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    report_id uuid NOT NULL,
    code character varying(50),
    output_type integer DEFAULT 0 NOT NULL,
    is_default boolean DEFAULT false,
    is_custom boolean DEFAULT false,
    is_alterable_output boolean DEFAULT false,
    is_groovy boolean DEFAULT false,
    custom_defined_by integer DEFAULT 100,
    custom_class character varying,
    output_name_pattern character varying(255),
    name character varying(500),
    content bytea
);


ALTER TABLE public.report_template OWNER TO cuba;

--
-- TOC entry 216 (class 1259 OID 37029)
-- Name: sec_constraint; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_constraint (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    code character varying(255),
    check_type character varying(50) DEFAULT 'db'::character varying,
    operation_type character varying(50) DEFAULT 'read'::character varying,
    entity_name character varying(255) NOT NULL,
    join_clause character varying(500),
    where_clause character varying(1000),
    groovy_script text,
    filter_xml text,
    is_active boolean DEFAULT true,
    group_id uuid
);


ALTER TABLE public.sec_constraint OWNER TO cuba;

--
-- TOC entry 217 (class 1259 OID 37039)
-- Name: sec_entity_log; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_entity_log (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    event_ts timestamp without time zone,
    user_id uuid,
    change_type character(1),
    entity character varying(100),
    entity_instance_name character varying(1000),
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    changes text
);


ALTER TABLE public.sec_entity_log OWNER TO cuba;

--
-- TOC entry 218 (class 1259 OID 37045)
-- Name: sec_filter; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_filter (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    component character varying(200),
    name character varying(255),
    code character varying(200),
    xml text,
    user_id uuid,
    global_default boolean,
    username character varying(255)
);


ALTER TABLE public.sec_filter OWNER TO cuba;

--
-- TOC entry 219 (class 1259 OID 37052)
-- Name: sec_group; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_group (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    name character varying(255) NOT NULL,
    parent_id uuid
);


ALTER TABLE public.sec_group OWNER TO cuba;

--
-- TOC entry 220 (class 1259 OID 37059)
-- Name: sec_group_hierarchy; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_group_hierarchy (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    group_id uuid,
    parent_id uuid,
    hierarchy_level integer
);


ALTER TABLE public.sec_group_hierarchy OWNER TO cuba;

--
-- TOC entry 221 (class 1259 OID 37062)
-- Name: sec_localized_constraint_msg; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_localized_constraint_msg (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    entity_name character varying(255) NOT NULL,
    operation_type character varying(50) NOT NULL,
    values_ text
);


ALTER TABLE public.sec_localized_constraint_msg OWNER TO cuba;

--
-- TOC entry 222 (class 1259 OID 37069)
-- Name: sec_logged_attr; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_logged_attr (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    entity_id uuid,
    name character varying(255)
);


ALTER TABLE public.sec_logged_attr OWNER TO cuba;

--
-- TOC entry 223 (class 1259 OID 37072)
-- Name: sec_logged_entity; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_logged_entity (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    name character varying(100),
    auto boolean,
    manual boolean
);


ALTER TABLE public.sec_logged_entity OWNER TO cuba;

--
-- TOC entry 224 (class 1259 OID 37075)
-- Name: sec_permission; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_permission (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    permission_type integer,
    target character varying(100),
    value_ integer,
    role_id uuid
);


ALTER TABLE public.sec_permission OWNER TO cuba;

--
-- TOC entry 225 (class 1259 OID 37079)
-- Name: sec_presentation; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_presentation (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    sys_tenant_id character varying(255),
    component character varying(200),
    name character varying(255),
    xml character varying(7000),
    user_id uuid,
    is_auto_save boolean
);


ALTER TABLE public.sec_presentation OWNER TO cuba;

--
-- TOC entry 226 (class 1259 OID 37085)
-- Name: sec_remember_me; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_remember_me (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    user_id uuid NOT NULL,
    token character varying(32) NOT NULL
);


ALTER TABLE public.sec_remember_me OWNER TO cuba;

--
-- TOC entry 263 (class 1259 OID 37759)
-- Name: sec_resource_policy; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_resource_policy (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    type_ character varying(255) NOT NULL,
    policy_group character varying(255),
    resource_ character varying(1000) NOT NULL,
    action_ character varying(255) NOT NULL,
    effect character varying(255) NOT NULL,
    role_id uuid NOT NULL
);


ALTER TABLE public.sec_resource_policy OWNER TO cuba;

--
-- TOC entry 261 (class 1259 OID 37741)
-- Name: sec_resource_role; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_resource_role (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    child_roles text,
    sys_tenant_id character varying(255)
);


ALTER TABLE public.sec_resource_role OWNER TO cuba;

--
-- TOC entry 227 (class 1259 OID 37089)
-- Name: sec_role; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_role (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    name character varying(255) NOT NULL,
    loc_name character varying(255),
    description character varying(1000),
    is_default_role boolean,
    role_type integer,
    security_scope character varying(255)
);


ALTER TABLE public.sec_role OWNER TO cuba;

--
-- TOC entry 265 (class 1259 OID 37787)
-- Name: sec_role_assignment; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_role_assignment (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    username character varying(255) NOT NULL,
    role_code character varying(255) NOT NULL,
    role_type character varying(255) NOT NULL
);


ALTER TABLE public.sec_role_assignment OWNER TO cuba;

--
-- TOC entry 264 (class 1259 OID 37773)
-- Name: sec_row_level_policy; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_row_level_policy (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    type_ character varying(255) NOT NULL,
    action_ character varying(255) NOT NULL,
    entity_name character varying(255) NOT NULL,
    where_clause text,
    join_clause text,
    script_ text,
    role_id uuid NOT NULL
);


ALTER TABLE public.sec_row_level_policy OWNER TO cuba;

--
-- TOC entry 262 (class 1259 OID 37750)
-- Name: sec_row_level_role; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_row_level_role (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    child_roles text,
    sys_tenant_id character varying(255)
);


ALTER TABLE public.sec_row_level_role OWNER TO cuba;

--
-- TOC entry 228 (class 1259 OID 37096)
-- Name: sec_screen_history; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_screen_history (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    user_id uuid,
    caption character varying(255),
    url text,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    substituted_user_id uuid
);


ALTER TABLE public.sec_screen_history OWNER TO cuba;

--
-- TOC entry 229 (class 1259 OID 37102)
-- Name: sec_search_folder; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_search_folder (
    folder_id uuid NOT NULL,
    filter_component character varying(200),
    filter_xml character varying(7000),
    user_id uuid,
    presentation_id uuid,
    apply_default boolean,
    is_set boolean,
    entity_type character varying(50)
);


ALTER TABLE public.sec_search_folder OWNER TO cuba;

--
-- TOC entry 230 (class 1259 OID 37108)
-- Name: sec_session_attr; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_session_attr (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    name character varying(50),
    str_value character varying(1000),
    datatype character varying(20),
    group_id uuid
);


ALTER TABLE public.sec_session_attr OWNER TO cuba;

--
-- TOC entry 231 (class 1259 OID 37115)
-- Name: sec_session_log; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_session_log (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    session_id uuid NOT NULL,
    user_id uuid NOT NULL,
    substituted_user_id uuid,
    user_data text,
    last_action integer NOT NULL,
    client_info character varying(512),
    client_type character varying(10),
    address character varying(255),
    started_ts timestamp without time zone,
    finished_ts timestamp without time zone,
    server_id character varying(128)
);


ALTER TABLE public.sec_session_log OWNER TO cuba;

--
-- TOC entry 232 (class 1259 OID 37122)
-- Name: sec_user; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_user (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    login character varying(50),
    login_lc character varying(50),
    password character varying(255),
    password_encryption character varying(50),
    name character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    middle_name character varying(255),
    position_ character varying(255),
    email character varying(100),
    language_ character varying(20),
    time_zone character varying(50),
    time_zone_auto boolean,
    active boolean,
    group_id uuid,
    group_names character varying(255),
    ip_mask character varying(200),
    change_password_at_logon boolean,
    username character varying(255),
    enabled boolean
);


ALTER TABLE public.sec_user OWNER TO cuba;

--
-- TOC entry 233 (class 1259 OID 37129)
-- Name: sec_user_role; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_user_role (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    user_id uuid,
    role_id uuid,
    role_name character varying(50)
);


ALTER TABLE public.sec_user_role OWNER TO cuba;

--
-- TOC entry 234 (class 1259 OID 37133)
-- Name: sec_user_setting; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_user_setting (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    user_id uuid,
    client_type character(1),
    name character varying(255),
    value_ text
);


ALTER TABLE public.sec_user_setting OWNER TO cuba;

--
-- TOC entry 235 (class 1259 OID 37139)
-- Name: sec_user_substitution; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sec_user_substitution (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    user_id uuid NOT NULL,
    substituted_user_id uuid NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone
);


ALTER TABLE public.sec_user_substitution OWNER TO cuba;

--
-- TOC entry 236 (class 1259 OID 37143)
-- Name: sys_app_folder; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_app_folder (
    folder_id uuid NOT NULL,
    filter_component character varying(200),
    filter_xml character varying(7000),
    visibility_script text,
    quantity_script text,
    apply_default boolean
);


ALTER TABLE public.sys_app_folder OWNER TO cuba;

--
-- TOC entry 237 (class 1259 OID 37149)
-- Name: sys_attr_value; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_attr_value (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    category_attr_id uuid NOT NULL,
    code character varying(255) NOT NULL,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    string_value character varying,
    integer_value integer,
    double_value numeric(36,6),
    decimal_value numeric(36,10),
    date_value timestamp without time zone,
    date_wo_time_value date,
    boolean_value boolean,
    entity_value uuid,
    string_entity_value character varying(255),
    int_entity_value integer,
    long_entity_value bigint,
    parent_id uuid
);


ALTER TABLE public.sys_attr_value OWNER TO cuba;

--
-- TOC entry 238 (class 1259 OID 37156)
-- Name: sys_category; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_category (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    special character varying(50),
    entity_type character varying(100) NOT NULL,
    is_default boolean,
    discriminator integer,
    locale_names character varying(1000)
);


ALTER TABLE public.sys_category OWNER TO cuba;

--
-- TOC entry 239 (class 1259 OID 37163)
-- Name: sys_category_attr; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_category_attr (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    category_entity_type character varying(4000),
    name character varying(255),
    code character varying(255) NOT NULL,
    description character varying(1000),
    category_id uuid NOT NULL,
    entity_class character varying(500),
    data_type character varying(200),
    default_string character varying,
    default_int integer,
    default_double numeric(36,6),
    default_decimal numeric(36,10),
    default_date timestamp without time zone,
    default_date_wo_time date,
    default_date_is_current boolean,
    default_boolean boolean,
    default_entity_value uuid,
    default_str_entity_value character varying(255),
    default_int_entity_value integer,
    default_long_entity_value bigint,
    enumeration character varying(500),
    order_no integer,
    screen character varying(255),
    required boolean,
    lookup boolean,
    target_screens character varying(4000),
    width character varying(20),
    rows_count integer,
    is_collection boolean,
    join_clause character varying(4000),
    where_clause character varying(4000),
    filter_xml text,
    locale_names character varying(1000),
    locale_descriptions character varying(4000),
    enumeration_locales character varying(5000),
    attribute_configuration_json text
);


ALTER TABLE public.sys_category_attr OWNER TO cuba;

--
-- TOC entry 240 (class 1259 OID 37170)
-- Name: sys_config; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_config (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    name character varying(255) NOT NULL,
    value_ text NOT NULL
);


ALTER TABLE public.sys_config OWNER TO cuba;

--
-- TOC entry 241 (class 1259 OID 37177)
-- Name: sys_db_changelog; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_db_changelog (
    script_name character varying(300) NOT NULL,
    create_ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_init integer DEFAULT 0
);


ALTER TABLE public.sys_db_changelog OWNER TO cuba;

--
-- TOC entry 242 (class 1259 OID 37182)
-- Name: sys_entity_snapshot; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_entity_snapshot (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    entity_meta_class character varying(50) NOT NULL,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    author_id uuid NOT NULL,
    view_xml text NOT NULL,
    snapshot_xml text NOT NULL,
    snapshot_date timestamp without time zone NOT NULL
);


ALTER TABLE public.sys_entity_snapshot OWNER TO cuba;

--
-- TOC entry 243 (class 1259 OID 37188)
-- Name: sys_entity_statistics; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_entity_statistics (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    name character varying(50),
    instance_count bigint,
    fetch_ui integer,
    max_fetch_ui integer,
    lazy_collection_threshold integer,
    lookup_screen_threshold integer
);


ALTER TABLE public.sys_entity_statistics OWNER TO cuba;

--
-- TOC entry 244 (class 1259 OID 37191)
-- Name: sys_file; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_file (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    name character varying(500) NOT NULL,
    ext character varying(20),
    file_size bigint,
    create_date timestamp without time zone
);


ALTER TABLE public.sys_file OWNER TO cuba;

--
-- TOC entry 245 (class 1259 OID 37198)
-- Name: sys_folder; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_folder (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    folder_type character(1),
    parent_id uuid,
    name character varying(100),
    tab_name character varying(100),
    sort_order integer
);


ALTER TABLE public.sys_folder OWNER TO cuba;

--
-- TOC entry 246 (class 1259 OID 37205)
-- Name: sys_fts_queue; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_fts_queue (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint,
    entity_name character varying(200),
    change_type character(1),
    source_host character varying(255),
    indexing_host character varying(255),
    fake boolean
);


ALTER TABLE public.sys_fts_queue OWNER TO cuba;

--
-- TOC entry 247 (class 1259 OID 37211)
-- Name: sys_jmx_instance; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_jmx_instance (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    node_name character varying(255),
    address character varying(500) NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.sys_jmx_instance OWNER TO cuba;

--
-- TOC entry 248 (class 1259 OID 37218)
-- Name: sys_lock_config; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_lock_config (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    name character varying(100),
    timeout_sec integer
);


ALTER TABLE public.sys_lock_config OWNER TO cuba;

--
-- TOC entry 249 (class 1259 OID 37221)
-- Name: sys_query_result_seq; Type: SEQUENCE; Schema: public; Owner: cuba
--

CREATE SEQUENCE public.sys_query_result_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_query_result_seq OWNER TO cuba;

--
-- TOC entry 250 (class 1259 OID 37223)
-- Name: sys_query_result; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_query_result (
    id bigint DEFAULT nextval('public.sys_query_result_seq'::regclass) NOT NULL,
    session_id uuid NOT NULL,
    query_key integer NOT NULL,
    entity_id uuid,
    string_entity_id character varying(255),
    int_entity_id integer,
    long_entity_id bigint
);


ALTER TABLE public.sys_query_result OWNER TO cuba;

--
-- TOC entry 251 (class 1259 OID 37227)
-- Name: sys_scheduled_execution; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_scheduled_execution (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    sys_tenant_id character varying(255),
    task_id uuid,
    server character varying(512),
    start_time timestamp with time zone,
    finish_time timestamp with time zone,
    result text
);


ALTER TABLE public.sys_scheduled_execution OWNER TO cuba;

--
-- TOC entry 252 (class 1259 OID 37233)
-- Name: sys_scheduled_task; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_scheduled_task (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    defined_by character varying(1) DEFAULT 'B'::character varying,
    class_name character varying(500),
    script_name character varying(500),
    bean_name character varying(50),
    method_name character varying(50),
    method_params character varying(4000),
    user_name character varying(50),
    is_singleton boolean,
    is_active boolean,
    period_ integer,
    timeout integer,
    start_date timestamp without time zone,
    time_frame integer,
    start_delay integer,
    permitted_servers character varying(4096),
    log_start boolean,
    log_finish boolean,
    last_start_time timestamp with time zone,
    last_start_server character varying(512),
    description character varying(1000),
    cron character varying(100),
    scheduling_type character varying(1) DEFAULT 'P'::character varying
);


ALTER TABLE public.sys_scheduled_task OWNER TO cuba;

--
-- TOC entry 253 (class 1259 OID 37241)
-- Name: sys_sending_attachment; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_sending_attachment (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    message_id uuid,
    content bytea,
    content_file_id uuid,
    content_id character varying(50),
    name character varying(500),
    disposition character varying(50),
    text_encoding character varying(50)
);


ALTER TABLE public.sys_sending_attachment OWNER TO cuba;

--
-- TOC entry 254 (class 1259 OID 37248)
-- Name: sys_sending_message; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_sending_message (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp with time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    address_to text,
    address_cc text,
    address_bcc text,
    address_from character varying(100),
    caption character varying(500),
    email_headers character varying(500),
    content_text text,
    content_text_file_id uuid,
    deadline timestamp with time zone,
    status integer,
    date_sent timestamp without time zone,
    attempts_count integer,
    attempts_made integer,
    attachments_name text,
    body_content_type character varying(50)
);


ALTER TABLE public.sys_sending_message OWNER TO cuba;

--
-- TOC entry 255 (class 1259 OID 37255)
-- Name: sys_server; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.sys_server (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    name character varying(255),
    is_running boolean,
    data text
);


ALTER TABLE public.sys_server OWNER TO cuba;

--
-- TOC entry 260 (class 1259 OID 37733)
-- Name: ui_filter_configuration; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ui_filter_configuration (
    id uuid NOT NULL,
    component_id character varying(255) NOT NULL,
    configuration_id character varying(255) NOT NULL,
    username character varying(255),
    root_condition text,
    sys_tenant_id character varying(255),
    name character varying(255),
    default_for_all boolean
);


ALTER TABLE public.ui_filter_configuration OWNER TO cuba;

--
-- TOC entry 258 (class 1259 OID 37717)
-- Name: ui_setting; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ui_setting (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    username character varying(255),
    name character varying(255),
    value_ text
);


ALTER TABLE public.ui_setting OWNER TO cuba;

--
-- TOC entry 259 (class 1259 OID 37725)
-- Name: ui_table_presentation; Type: TABLE; Schema: public; Owner: cuba
--

CREATE TABLE public.ui_table_presentation (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    component character varying(255),
    name character varying(255),
    settings character varying(4000),
    username character varying(255),
    is_auto_save boolean,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    sys_tenant_id character varying(255)
);


ALTER TABLE public.ui_table_presentation OWNER TO cuba;

--
-- TOC entry 3568 (class 0 OID 37711)
-- Dependencies: 257
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	ui-data	io/jmix/uidata/liquibase/changelog/001-ui-data.xml	2021-03-11 11:26:07.985084	1	EXECUTED	8:51e7cbebcd894eff621210f2eec52486	createTable tableName=UI_SETTING; createTable tableName=UI_TABLE_PRESENTATION		\N	4.2.2	\N	\N	5447567852
2	ui-data	io/jmix/uidata/liquibase/changelog/001-ui-data.xml	2021-03-11 11:26:07.99751	2	EXECUTED	8:9b2741cf42ed98a04110bdc8eda09792	createTable tableName=UI_FILTER_CONFIGURATION		\N	4.2.2	\N	\N	5447567852
3	ui-data	io/jmix/uidata/liquibase/changelog/001-ui-data.xml	2021-03-11 11:26:08.004893	3	EXECUTED	8:5a467792853b394bd3b2a01768bb1170	addColumn tableName=UI_TABLE_PRESENTATION; addColumn tableName=UI_FILTER_CONFIGURATION		\N	4.2.2	\N	\N	5447567852
4	ui-data	io/jmix/uidata/liquibase/changelog/001-ui-data.xml	2021-03-11 11:26:08.013331	4	EXECUTED	8:8d5d3ffa3d4b15a3dfd956e818bbd5b5	addColumn tableName=UI_FILTER_CONFIGURATION; renameColumn newColumnName=CONFIGURATION_ID, oldColumnName=CODE, tableName=UI_FILTER_CONFIGURATION		\N	4.2.2	\N	\N	5447567852
1	security-data	io/jmix/securitydata/liquibase/changelog/001-security-data.xml	2021-03-11 11:26:08.046905	5	EXECUTED	8:503f3f1463afb1a6ee2f72a85913268d	createTable tableName=SEC_RESOURCE_ROLE; createTable tableName=SEC_ROW_LEVEL_ROLE; createTable tableName=SEC_RESOURCE_POLICY; createTable tableName=SEC_ROW_LEVEL_POLICY; createTable tableName=SEC_ROLE_ASSIGNMENT		\N	4.2.2	\N	\N	5447567852
2-postgresql	security-data	io/jmix/securitydata/liquibase/changelog/001-security-data.xml	2021-03-11 11:26:08.055605	6	EXECUTED	8:5e8fed89820fc19ad46bac760946611f	createIndex indexName=IDX_RESOURCE_ROLE_UN_C, tableName=SEC_RESOURCE_ROLE		\N	4.2.2	\N	\N	5447567852
3-postgresql	security-data	io/jmix/securitydata/liquibase/changelog/001-security-data.xml	2021-03-11 11:26:08.063528	7	EXECUTED	8:feaca99b2547af6854072f5ee7940485	createIndex indexName=IDX_ROW_LEVEL_ROLE_UN_C, tableName=SEC_ROW_LEVEL_ROLE		\N	4.2.2	\N	\N	5447567852
4	security-data	io/jmix/securitydata/liquibase/changelog/001-security-data.xml	2021-03-11 11:26:08.071602	8	EXECUTED	8:604553db900aa6050bcdd0bd49ff2085	createTable tableName=persistent_logins		\N	4.2.2	\N	\N	5447567852
1	migrator	com/haulmont/samples/ratlab/liquibase/changelog/010-migration.xml	2021-03-11 11:26:08.08113	9	EXECUTED	8:e9bf8f7702bcdc7e18ef779828a5cbb9	addColumn tableName=SEC_USER		\N	4.2.2	\N	\N	5447567852
2	migrator	com/haulmont/samples/ratlab/liquibase/changelog/010-migration.xml	2021-03-11 11:26:08.08977	10	EXECUTED	8:e4d2519d8201e5670ca43dd31f8282c3	update tableName=SEC_USER		\N	4.2.2	\N	\N	5447567852
3	migrator	com/haulmont/samples/ratlab/liquibase/changelog/010-migration.xml	2021-03-11 11:26:08.096523	11	EXECUTED	8:aa1841078fad6f22e45257d0aae739ab	update tableName=SEC_USER		\N	4.2.2	\N	\N	5447567852
4	migrator	com/haulmont/samples/ratlab/liquibase/changelog/010-migration.xml	2021-03-11 11:26:08.104184	12	EXECUTED	8:3e18db152d670548015e9593489f0546	dropNotNullConstraint columnName=LOGIN, tableName=SEC_USER; dropNotNullConstraint columnName=LOGIN_LC, tableName=SEC_USER		\N	4.2.2	\N	\N	5447567852
5	migrator	com/haulmont/samples/ratlab/liquibase/changelog/010-migration.xml	2021-03-11 11:26:08.110913	13	EXECUTED	8:b108f6a75d4d0d1a2fe2b59d4055867c	insert tableName=SEC_ROLE_ASSIGNMENT		\N	4.2.2	\N	\N	5447567852
6	migrator	com/haulmont/samples/ratlab/liquibase/changelog/010-migration.xml	2021-03-11 11:26:08.117896	14	EXECUTED	8:3094619f54d4bf8cf41cf8a165c22479	addColumn tableName=SEC_FILTER		\N	4.2.2	\N	\N	5447567852
7	migrator	com/haulmont/samples/ratlab/liquibase/changelog/010-migration.xml	2021-03-11 11:26:08.126485	15	EXECUTED	8:ccb84c1e396d8b9d2ee6cbd704858834	update tableName=SEC_FILTER		\N	4.2.2	\N	\N	5447567852
\.


--
-- TOC entry 3567 (class 0 OID 37706)
-- Dependencies: 256
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- TOC entry 3577 (class 0 OID 37798)
-- Dependencies: 266
-- Data for Name: persistent_logins; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.persistent_logins (series, username, token, last_used) FROM stdin;
\.


--
-- TOC entry 3513 (class 0 OID 36945)
-- Dependencies: 202
-- Data for Name: ratlab_certificate; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_certificate (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, title, aquired, code, description, owner_id) FROM stdin;
6805915f-eb67-99d9-26a4-3e43219fbf63	2	2021-03-02 17:01:33.293	admin	2021-03-03 21:12:55.158	admin	\N	\N	General 1	2021-03-09 01:23:00	C_G1	aaa	0630c942-5a35-c576-b7d3-135976e781f4
a08df8e9-6c5a-41c1-2279-20e5cb2e4c2c	1	2021-03-03 21:16:22.508	admin	2021-03-03 21:16:22.508	\N	\N	\N	Greater security certificate	2019-03-05 00:00:00	S_GSC_10	Yet another certificate	7be1ca03-1905-e711-87c1-9f1ad812ba20
f406329f-556e-310c-2ea1-ec04f505826e	2	2021-03-02 17:01:52.982	admin	2021-03-03 21:16:39.594	admin	\N	\N	General 2	2021-03-10 15:56:00	C_G2	\N	bdb01fff-a8f4-37ac-e93c-eaca2fbc86cc
8829a13d-bfe9-b310-ce1b-c4e2651625eb	2	2021-03-03 21:52:57.484	admin	2021-03-03 21:53:33.237	admin	\N	\N	Drakkar master	2020-12-14 00:00:00	F_DM	d a	7be1ca03-1905-e711-87c1-9f1ad812ba20
40f9b6a8-3fff-818f-69f0-fdd9141d1092	1	2021-03-11 22:24:02.549	admin	2021-03-11 22:24:02.549	\N	\N	\N	Sansara	2016-02-01 02:03:00	S_N_S	XZ	964b9b7a-f863-15ca-3b0e-e2f16f8abcdb
\.


--
-- TOC entry 3514 (class 0 OID 36951)
-- Dependencies: 203
-- Data for Name: ratlab_employee; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_employee (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, home_address_country, home_address_town, home_address_field1, home_address_latitude, home_address_longitude, home_address_field2, home_address_field3, home_address_field4, home_address_field5, name, position_, experience, since, laboratory_id, supervisor_id) FROM stdin;
9e79e75c-d264-16ca-c605-87e569dc55ee	5	2021-03-02 17:19:11.966	admin	2021-03-03 17:35:22.325	admin	\N	\N	Russia	Moscow	Solncevskaya st.	0.34	-2.34	1	23	E	123548	Semen	intern	2	2021-02-10 00:00:00	33f18727-5529-5468-c4e7-9bfaed245e23	bdb01fff-a8f4-37ac-e93c-eaca2fbc86cc
0630c942-5a35-c576-b7d3-135976e781f4	4	2021-03-02 17:21:45.389	admin	2021-03-04 13:42:57.813	admin	\N	\N	Russia	Moscow	Sharikoposhipnikoskaya street	\N	\N	52	11	A	123321	Iogann	director	20	2020-03-10 00:00:00	33f18727-5529-5468-c4e7-9bfaed245e23	7be1ca03-1905-e711-87c1-9f1ad812ba20
7be1ca03-1905-e711-87c1-9f1ad812ba20	8	2021-03-02 17:23:24.287	admin	2021-03-11 22:22:09.702	admin	\N	\N	[DELETED]	[DELETED]	[DELETED]	0	0	[DELETED]	[DELETED]	[DELETED]	[DELETED]	X	chiefExecutiveOfficer	30	2019-03-08 00:00:00	ff2003eb-c360-5ce6-1a1c-619b7c3de9c7	\N
964b9b7a-f863-15ca-3b0e-e2f16f8abcdb	1	2021-03-11 22:24:02.549	admin	2021-03-11 22:24:02.549	\N	\N	\N	1	2	3	2	1	4	5	4	3	Morgan	professor	7	2018-02-01 00:00:00	\N	7be1ca03-1905-e711-87c1-9f1ad812ba20
0627ccbc-1bf7-7317-907d-6797c5634905	1	2021-03-12 11:37:58.687	admin	2021-03-12 11:37:58.687	\N	\N	\N	1	2	3	2	1	4	5	4	3	Eremey	professor	8	2023-02-01 00:00:00	\N	7be1ca03-1905-e711-87c1-9f1ad812ba20
bdb01fff-a8f4-37ac-e93c-eaca2fbc86cc	7	2021-03-02 18:02:20.923	admin	2021-03-14 19:20:20.837	admin	\N	\N	dd	ff	d	\N	\N	4	5	6	7	Vasiliy	researcher	3	2020-12-15 00:00:00	bd912f7b-6793-8c63-72ad-177923c1eaa7	0630c942-5a35-c576-b7d3-135976e781f4
\.


--
-- TOC entry 3515 (class 0 OID 36957)
-- Dependencies: 204
-- Data for Name: ratlab_employee_research_link; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_employee_research_link (employee_id, research_id) FROM stdin;
0630c942-5a35-c576-b7d3-135976e781f4	3723814f-bdde-20c8-934d-f0dadfa8efd7
9e79e75c-d264-16ca-c605-87e569dc55ee	3723814f-bdde-20c8-934d-f0dadfa8efd7
\.


--
-- TOC entry 3516 (class 0 OID 36960)
-- Dependencies: 205
-- Data for Name: ratlab_laboratory; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_laboratory (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, address_country, address_town, address_field1, address_latitude, address_longitude, address_field2, address_field3, address_field4, address_field5, title, description, day_start, day_end, code) FROM stdin;
0f9a39ea-1e5f-eefc-46f2-c13b695827f4	2	2021-03-02 17:00:15.805	admin	2021-03-03 15:48:45.869	admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Behaviour	cba	07:00:00	18:00:00	BEH
33f18727-5529-5468-c4e7-9bfaed245e23	2	2021-03-02 16:59:45.453	admin	2021-03-03 15:48:59.079	admin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Physical 1	abc	08:00:00	20:00:00	PHY_1
ff2003eb-c360-5ce6-1a1c-619b7c3de9c7	1	2021-03-11 22:22:09.696	admin	2021-03-11 22:22:09.696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	New lab	for test	06:00:00	23:30:00	N_L
bd912f7b-6793-8c63-72ad-177923c1eaa7	1	2021-03-14 19:20:20.828	admin	2021-03-14 19:20:20.828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Other new lab	2	01:00:00	10:00:00	T2
\.


--
-- TOC entry 3517 (class 0 OID 36966)
-- Dependencies: 206
-- Data for Name: ratlab_misc_resource; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_misc_resource (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, name, amount, type_, consumable) FROM stdin;
75e46da3-cbbf-9e0c-c5a3-8627732efb2c	2	2021-03-02 18:05:57.661	admin	2021-03-04 21:16:54.947	admin	\N	\N	Unit 1	1.00	device	f
a615a714-4309-4190-edd1-2d14f357538d	4	2021-03-02 18:05:20.748	admin	2021-03-05 18:46:08.338	admin	\N	\N	Large container	11.00	container	f
01ddd34d-71ec-d343-2ee3-27c8a2c2c2f2	269	2021-03-02 18:04:21.049	admin	2021-03-14 19:43:58.344	system	\N	\N	Tape	12124.00	consumable	t
366565fa-8a19-557e-12b6-d1fcf0129def	270	2021-03-02 18:03:35.948	admin	2021-03-14 19:43:58.344	system	\N	\N	R2	244.00	chemical	t
6bc3d139-c6f4-328e-3487-7437199a4b56	270	2021-03-02 18:03:27.29	admin	2021-03-14 19:43:58.344	system	\N	\N	R1	269.00	chemical	t
5c832e86-9a72-f82a-d1d3-e6bb0b2c6b48	1	2021-03-11 21:51:09.209	admin	2021-03-11 21:51:09.209	\N	\N	\N	Unit 2	3.00	device	f
e5d26710-cb48-22c3-f112-dfdfa45300f3	5	2021-03-02 18:05:04.453	admin	2021-03-11 21:03:21.417	admin	\N	\N	forceps	9.00	tool	f
\.


--
-- TOC entry 3518 (class 0 OID 36970)
-- Dependencies: 207
-- Data for Name: ratlab_rat; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_rat (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, name, color, checked) FROM stdin;
cb3dd096-1570-efb0-f53c-ec937317658c	1	2021-03-02 16:57:49.236	admin	2021-03-02 16:57:49.236	\N	\N	\N	Pinky	White	t
f4d11f6d-bac0-fe6e-b54f-144162744088	1	2021-03-02 16:58:03.283	admin	2021-03-02 16:58:03.283	\N	\N	\N	Brain	White	t
6dc254ce-a29b-684e-3c8f-c29c443bbe2f	1	2021-03-02 16:58:37.684	admin	2021-03-02 16:58:37.684	\N	\N	\N	John	Black	\N
db7718e0-82d1-a0e2-72f6-52a04d66f6db	1	2021-03-02 16:58:55.908	admin	2021-03-02 16:58:55.908	\N	\N	\N	Pumpkin	Ginger	\N
bf5fa95b-4dee-7fc1-03e8-ae6a2328bbd8	1	2021-03-03 14:48:52.43	admin	2021-03-03 14:48:52.43	\N	\N	\N	Earl	Gray	t
f7ab1be8-8b55-b399-0aab-8caca033132c	1	2021-03-11 22:21:17.608	admin	2021-03-11 22:21:17.608	\N	\N	\N	Lonely-Lokli	White	\N
\.


--
-- TOC entry 3519 (class 0 OID 36976)
-- Dependencies: 208
-- Data for Name: ratlab_research; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_research (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, title, start_time, description, state) FROM stdin;
2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	26	2021-03-02 17:01:06.64	admin	2021-03-05 18:46:08.338	admin	\N	\N	Lack of resources	2021-03-09 20:00:00+00	\N	40
3723814f-bdde-20c8-934d-f0dadfa8efd7	9	2021-03-02 17:00:48.111	admin	2021-03-11 21:03:32.336	admin	\N	\N	Base behaviour	2021-03-16 20:00:00+00	\N	40
\.


--
-- TOC entry 3520 (class 0 OID 36982)
-- Dependencies: 209
-- Data for Name: ratlab_research_requirement; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_research_requirement (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, research_id, mandatory) FROM stdin;
f1c7f8dd-2cd5-9902-13c9-9e714cafafee	3	2021-03-05 17:45:47.521	admin	2021-03-05 18:07:07.554	admin	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f
4d1a9ae7-b3af-fac0-c2c0-c52e7b327a26	3	2021-03-05 17:45:47.531	admin	2021-03-05 18:07:07.554	admin	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f
\.


--
-- TOC entry 3521 (class 0 OID 36985)
-- Dependencies: 210
-- Data for Name: ratlab_resource_requirement; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_resource_requirement (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, research_id, mandatory, resource_id, provided, amount, consume) FROM stdin;
ef16209f-60be-6766-640c-e4d63f0fac09	3	2021-03-05 18:45:50.078	admin	2021-03-05 18:46:08.338	admin	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f	366565fa-8a19-557e-12b6-d1fcf0129def	0	35	f
77eb7728-cf2b-0da7-89e1-90892b6bc2c2	3	2021-03-05 18:45:50.085	admin	2021-03-05 18:46:08.338	admin	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f	a615a714-4309-4190-edd1-2d14f357538d	0	2	f
cb68c8a8-af56-bcb6-43e3-d89e62b34fd0	3	2021-03-11 16:37:53.559	admin	2021-03-11 21:03:32.336	admin	\N	\N	3723814f-bdde-20c8-934d-f0dadfa8efd7	f	6bc3d139-c6f4-328e-3487-7437199a4b56	0	6	f
484a7990-49e1-adae-3f74-f35991b8c928	3	2021-03-11 12:19:32.758	admin	2021-03-11 21:03:32.336	admin	\N	\N	3723814f-bdde-20c8-934d-f0dadfa8efd7	f	366565fa-8a19-557e-12b6-d1fcf0129def	0	4	f
4a37dd53-0e8a-de10-b05a-8233da7f464d	3	2021-03-11 12:05:36.823	admin	2021-03-11 21:03:32.336	admin	\N	\N	3723814f-bdde-20c8-934d-f0dadfa8efd7	f	e5d26710-cb48-22c3-f112-dfdfa45300f3	0	3	t
\.


--
-- TOC entry 3522 (class 0 OID 36989)
-- Dependencies: 211
-- Data for Name: ratlab_subject_requirement; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ratlab_subject_requirement (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, research_id, mandatory, subject_id) FROM stdin;
541b56f4-8f4d-758d-c1cd-557c5da609ac	1	2021-03-05 18:45:50.059	admin	2021-03-05 18:45:50.059	\N	\N	\N	2c9c2fe9-913b-aea0-2e05-7be78c0f9ff3	f	db7718e0-82d1-a0e2-72f6-52a04d66f6db
\.


--
-- TOC entry 3523 (class 0 OID 36992)
-- Dependencies: 212
-- Data for Name: report_execution; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.report_execution (id, create_ts, created_by, report_id, report_name, report_code, user_id, start_time, finish_time, is_success, cancelled, params, error_message, server_id, output_document_id) FROM stdin;
\.


--
-- TOC entry 3524 (class 0 OID 37000)
-- Dependencies: 213
-- Data for Name: report_group; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.report_group (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, title, code, locale_names, sys_tenant_id) FROM stdin;
4e083530-0b9c-11e1-9b41-6bdaa41bff94	2021-03-04 11:32:35.37737	admin	0	\N	\N	\N	\N	General	ReportGroup.default	en=General\nru=Общие	\N
361e3e49-3a9f-5896-240b-075b5457fe66	2021-03-04 11:45:19.613	admin	1	2021-03-04 11:45:19.613	\N	\N	\N	Rats	RATS	\N	\N
\.


--
-- TOC entry 3525 (class 0 OID 37007)
-- Dependencies: 214
-- Data for Name: report_report; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.report_report (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, code, description, locale_names, group_id, report_type, default_template_id, xml, roles_idx, screens_idx, input_entity_types_idx, rest_access, is_system, sys_tenant_id) FROM stdin;
aaeea142-c520-6936-4488-aa0cceaaa504	2021-03-04 11:42:57.799	admin	6	2021-03-04 11:45:39.967	admin	\N	\N	Rat list	\N	\N	\N	361e3e49-3a9f-5896-240b-075b5457fe66	10	87252193-f0e3-d4ca-e288-d38072ca94f1	{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504","roles":[],"defaultTemplate":{"metaClass":"report$ReportTemplate","id":"87252193-f0e3-d4ca-e288-d38072ca94f1","code":"DEFAULT","customDefinedBy":"100","custom":"false","version":"1","outputNamePattern":"Rat list.xlsx","reportOutputType":"50","groovy":"false","report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"name":"Template for report \\"Rat list\\".xlsx","alterable":"false"},"bands":[{"metaClass":"report$BandDefinition","id":"35a5e634-33ea-e90b-6f9c-68108ad5ee48","orientation":"","childrenBandDefinitions":[{"metaClass":"report$BandDefinition","id":"2fa7ecb8-45ff-d7d5-d50e-66a53041f1d7","orientation":"0","childrenBandDefinitions":[],"name":"headerRats","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"35a5e634-33ea-e90b-6f9c-68108ad5ee48"},"report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"dataSets":[],"position":"0"},{"metaClass":"report$BandDefinition","id":"86f8125f-e1cc-bf29-33f2-d39a706fb917","orientation":"0","childrenBandDefinitions":[],"name":"Rats","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"35a5e634-33ea-e90b-6f9c-68108ad5ee48"},"report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"dataSets":[{"metaClass":"report$DataSet","id":"a6bb49c1-b254-86a0-996a-aab41103e196","type":"50","jsonSourceType":"10","name":"Dataset","listEntitiesParamName":"entities","useExistingView":"false","bandDefinition":{"metaClass":"report$BandDefinition","id":"86f8125f-e1cc-bf29-33f2-d39a706fb917"},"text":"return [[:]]","view":"{\\"entityClass\\":\\"ratlab_Rat\\",\\"name\\":\\"\\",\\"properties\\":{\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"color\\":{\\"name\\":\\"color\\",\\"fetchMode\\":\\"AUTO\\"},\\"checked\\":{\\"name\\":\\"checked\\",\\"fetchMode\\":\\"AUTO\\"},\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false}"}],"position":"1"}],"name":"Root","report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"dataSets":[],"position":"0"},{"metaClass":"report$BandDefinition","id":"2fa7ecb8-45ff-d7d5-d50e-66a53041f1d7"},{"metaClass":"report$BandDefinition","id":"86f8125f-e1cc-bf29-33f2-d39a706fb917"}],"inputParameters":[{"metaClass":"report$ReportInputParameter","id":"4f791e0e-a2c4-cfb7-afeb-81a2dcaf52fd","lookup":"false","entityMetaClass":"ratlab_Rat","predefinedTransformation":"","type":"60","required":"true","validationOn":"false","defaultDateIsCurrent":"false","report":{"metaClass":"report$Report","id":"aaeea142-c520-6936-4488-aa0cceaaa504"},"name":"Rat","alias":"entities","position":"1"}],"validationOn":"false","reportType":"10","reportScreens":[],"group":{"metaClass":"report$ReportGroup","id":"361e3e49-3a9f-5896-240b-075b5457fe66","code":"RATS","title":"Rats","version":"1"},"inputEntityTypesIdx":",ratlab_Rat,","valuesFormats":[],"templates":[{"metaClass":"report$ReportTemplate","id":"87252193-f0e3-d4ca-e288-d38072ca94f1"}],"version":"4","system":"false","name":"Rat list"}	\N	\N	,ratlab_Rat,	\N	f	\N
a57d1d4b-8a62-9738-866a-ad8ac84477bd	2021-03-04 11:44:27.12	admin	8	2021-03-04 14:28:56.022	admin	\N	\N	Проверенные особи	\N	\N	\N	361e3e49-3a9f-5896-240b-075b5457fe66	10	6d33b9e3-89ed-6a43-52e9-4f46dba9f40a	{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd","roles":[],"defaultTemplate":{"metaClass":"report$ReportTemplate","id":"6d33b9e3-89ed-6a43-52e9-4f46dba9f40a","code":"DEFAULT","customDefinedBy":"100","custom":"false","version":"1","outputNamePattern":"Report for entity \\"Rat\\".docx","reportOutputType":"40","groovy":"false","report":{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd"},"name":"Template for report \\"Report for entity \\"Rat\\"\\".docx","alterable":"false"},"bands":[{"metaClass":"report$BandDefinition","id":"072fc8cd-5bf1-753c-6100-595a1819330c","orientation":"","childrenBandDefinitions":[{"metaClass":"report$BandDefinition","id":"d822c686-e346-de70-8c5d-a43210aaa9a8","orientation":"0","childrenBandDefinitions":[],"name":"Rats","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"072fc8cd-5bf1-753c-6100-595a1819330c"},"report":{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd"},"dataSets":[{"metaClass":"report$DataSet","id":"02060946-45cc-ca27-55ff-1bbf1429f628","type":"20","jsonSourceType":"10","name":"Dataset","useExistingView":"false","bandDefinition":{"metaClass":"report$BandDefinition","id":"d822c686-e346-de70-8c5d-a43210aaa9a8"},"text":"select\\ne.name as \\"name\\",\\ne.color as \\"color\\",\\ne.id as \\"id\\"\\nfrom ratlab_Rat e where e.checked \\u003d ${checked1}","view":"null"}],"position":"0"}],"name":"Root","report":{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd"},"dataSets":[],"position":"0"},{"metaClass":"report$BandDefinition","id":"d822c686-e346-de70-8c5d-a43210aaa9a8"}],"inputParameters":[{"metaClass":"report$ReportInputParameter","id":"8cb86c67-b57a-dbf9-122c-dbce9862fe1e","lookup":"false","hidden":"false","defaultValue":"true","parameterClassName":"java.lang.Boolean","predefinedTransformation":"","type":"40","required":"true","validationOn":"false","defaultDateIsCurrent":"false","report":{"metaClass":"report$Report","id":"a57d1d4b-8a62-9738-866a-ad8ac84477bd"},"name":"Checked1","alias":"checked1","position":"1"}],"validationOn":"false","reportType":"10","reportScreens":[],"group":{"metaClass":"report$ReportGroup","id":"361e3e49-3a9f-5896-240b-075b5457fe66","code":"RATS","title":"Rats","version":"1"},"valuesFormats":[],"templates":[{"metaClass":"report$ReportTemplate","id":"6d33b9e3-89ed-6a43-52e9-4f46dba9f40a"}],"version":"6","system":"false","name":"Проверенные особи"}	\N	\N	\N	\N	f	\N
a84cd79d-8063-4467-b5c7-710cc9ff7142	2021-03-05 19:52:17.121	admin	4	2021-03-05 19:52:40.544	admin	\N	\N	Report for entity "Research"	\N	\N	\N	4e083530-0b9c-11e1-9b41-6bdaa41bff94	10	a786871c-7ab4-7d14-107c-82e0e9ac9b1c	{"metaClass":"report$Report","id":"a84cd79d-8063-4467-b5c7-710cc9ff7142","roles":[],"defaultTemplate":{"metaClass":"report$ReportTemplate","id":"a786871c-7ab4-7d14-107c-82e0e9ac9b1c","code":"DEFAULT","customDefinedBy":"100","custom":"false","version":"1","outputNamePattern":"Report for entity \\"Research\\".docx","reportOutputType":"40","groovy":"false","report":{"metaClass":"report$Report","id":"a84cd79d-8063-4467-b5c7-710cc9ff7142"},"name":"Template for report \\"Report for entity \\"Research\\"\\".docx","alterable":"false"},"bands":[{"metaClass":"report$BandDefinition","id":"7dadd292-58ff-b244-5a05-4a67109e518d","orientation":"","childrenBandDefinitions":[{"metaClass":"report$BandDefinition","id":"59b16463-83de-2b19-f666-de0da44837ec","orientation":"0","childrenBandDefinitions":[],"name":"Researchs","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"7dadd292-58ff-b244-5a05-4a67109e518d"},"report":{"metaClass":"report$Report","id":"a84cd79d-8063-4467-b5c7-710cc9ff7142"},"dataSets":[{"metaClass":"report$DataSet","id":"247c8a83-9cc4-58b5-75ba-13c42cd9ba0f","type":"50","jsonSourceType":"10","name":"Dataset","listEntitiesParamName":"entities","useExistingView":"false","bandDefinition":{"metaClass":"report$BandDefinition","id":"59b16463-83de-2b19-f666-de0da44837ec"},"text":"return [[:]]","view":"{\\"entityClass\\":\\"ratlab_Research\\",\\"name\\":\\"\\",\\"properties\\":{\\"description\\":{\\"name\\":\\"description\\",\\"fetchMode\\":\\"AUTO\\"},\\"startTime\\":{\\"name\\":\\"startTime\\",\\"fetchMode\\":\\"AUTO\\"},\\"state\\":{\\"name\\":\\"state\\",\\"fetchMode\\":\\"AUTO\\"},\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"title\\":{\\"name\\":\\"title\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false}"}],"position":"0"}],"name":"Root","report":{"metaClass":"report$Report","id":"a84cd79d-8063-4467-b5c7-710cc9ff7142"},"dataSets":[],"position":"0"},{"metaClass":"report$BandDefinition","id":"59b16463-83de-2b19-f666-de0da44837ec"}],"inputParameters":[{"metaClass":"report$ReportInputParameter","id":"dd1160c1-7a6a-7568-c461-01ce564bc2ac","lookup":"false","entityMetaClass":"ratlab_Research","predefinedTransformation":"","type":"60","required":"true","validationOn":"false","defaultDateIsCurrent":"false","report":{"metaClass":"report$Report","id":"a84cd79d-8063-4467-b5c7-710cc9ff7142"},"name":"Research","alias":"entities","position":"1"}],"validationOn":"false","reportType":"10","reportScreens":[],"group":{"metaClass":"report$ReportGroup","id":"4e083530-0b9c-11e1-9b41-6bdaa41bff94","localeNames":"en\\u003dGeneral\\nru\\u003dОбщие","code":"ReportGroup.default","title":"General","version":"0"},"inputEntityTypesIdx":",ratlab_Research,","valuesFormats":[],"templates":[{"metaClass":"report$ReportTemplate","id":"a786871c-7ab4-7d14-107c-82e0e9ac9b1c"}],"version":"2","system":"false","name":"Report for entity \\"Research\\""}	\N	\N	,ratlab_Research,	\N	f	\N
abe22d13-565a-e0a1-e8bb-ee60deba29a6	2021-03-05 19:54:54.804	admin	4	2021-03-05 19:55:28.083	admin	\N	\N	Report for entity "Research" (2)	\N	\N	\N	4e083530-0b9c-11e1-9b41-6bdaa41bff94	10	b5f9d089-2a2b-dff6-4f56-9755d3bfcadb	{"metaClass":"report$Report","id":"abe22d13-565a-e0a1-e8bb-ee60deba29a6","roles":[],"defaultTemplate":{"metaClass":"report$ReportTemplate","id":"b5f9d089-2a2b-dff6-4f56-9755d3bfcadb","code":"DEFAULT","customDefinedBy":"100","custom":"false","version":"1","outputNamePattern":"Report for entity \\"Research\\".docx","reportOutputType":"40","groovy":"false","report":{"metaClass":"report$Report","id":"abe22d13-565a-e0a1-e8bb-ee60deba29a6"},"name":"Template for report \\"Report for entity \\"Research\\"\\".docx","alterable":"false"},"bands":[{"metaClass":"report$BandDefinition","id":"ceb6e5ec-46c1-1148-2d2e-ee19fc7b7f60","orientation":"","childrenBandDefinitions":[{"metaClass":"report$BandDefinition","id":"494d0786-818f-e350-471d-ac6cbdf7cddf","orientation":"0","childrenBandDefinitions":[],"name":"Research1","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"ceb6e5ec-46c1-1148-2d2e-ee19fc7b7f60"},"report":{"metaClass":"report$Report","id":"abe22d13-565a-e0a1-e8bb-ee60deba29a6"},"dataSets":[{"metaClass":"report$DataSet","id":"f794b98e-6d05-71ca-4c4d-94ae9c0c49e5","entityParamName":"entity","type":"40","jsonSourceType":"10","name":"Dataset","useExistingView":"false","bandDefinition":{"metaClass":"report$BandDefinition","id":"494d0786-818f-e350-471d-ac6cbdf7cddf"},"text":"return [[:]]","view":"{\\"entityClass\\":\\"ratlab_Research\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"description\\":{\\"name\\":\\"description\\",\\"fetchMode\\":\\"AUTO\\"},\\"startTime\\":{\\"name\\":\\"startTime\\",\\"fetchMode\\":\\"AUTO\\"},\\"state\\":{\\"name\\":\\"state\\",\\"fetchMode\\":\\"AUTO\\"},\\"title\\":{\\"name\\":\\"title\\",\\"fetchMode\\":\\"AUTO\\"},\\"participants\\":{\\"name\\":\\"participants\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Employee\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"position\\":{\\"name\\":\\"position\\",\\"fetchMode\\":\\"AUTO\\"},\\"homeAddress\\":{\\"name\\":\\"homeAddress\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Address\\",\\"name\\":\\"\\",\\"properties\\":{\\"country\\":{\\"name\\":\\"country\\",\\"fetchMode\\":\\"AUTO\\"},\\"field1\\":{\\"name\\":\\"field1\\",\\"fetchMode\\":\\"AUTO\\"},\\"field2\\":{\\"name\\":\\"field2\\",\\"fetchMode\\":\\"AUTO\\"},\\"field3\\":{\\"name\\":\\"field3\\",\\"fetchMode\\":\\"AUTO\\"},\\"field4\\":{\\"name\\":\\"field4\\",\\"fetchMode\\":\\"AUTO\\"},\\"field5\\":{\\"name\\":\\"field5\\",\\"fetchMode\\":\\"AUTO\\"},\\"latitude\\":{\\"name\\":\\"latitude\\",\\"fetchMode\\":\\"AUTO\\"},\\"longitude\\":{\\"name\\":\\"longitude\\",\\"fetchMode\\":\\"AUTO\\"},\\"town\\":{\\"name\\":\\"town\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"laboratory\\":{\\"name\\":\\"laboratory\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Laboratory\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"code\\":{\\"name\\":\\"code\\",\\"fetchMode\\":\\"AUTO\\"},\\"title\\":{\\"name\\":\\"title\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"resources\\":{\\"name\\":\\"resources\\",\\"view\\":{\\"entityClass\\":\\"ratlab_ResourceRequirement\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"amount\\":{\\"name\\":\\"amount\\",\\"fetchMode\\":\\"AUTO\\"},\\"consume\\":{\\"name\\":\\"consume\\",\\"fetchMode\\":\\"AUTO\\"},\\"mandatory\\":{\\"name\\":\\"mandatory\\",\\"fetchMode\\":\\"AUTO\\"},\\"provided\\":{\\"name\\":\\"provided\\",\\"fetchMode\\":\\"AUTO\\"},\\"resource\\":{\\"name\\":\\"resource\\",\\"view\\":{\\"entityClass\\":\\"ratlab_MiscResource\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"consumable\\":{\\"name\\":\\"consumable\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"type\\":{\\"name\\":\\"type\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"subjects\\":{\\"name\\":\\"subjects\\",\\"view\\":{\\"entityClass\\":\\"ratlab_SubjectRequirement\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"subject\\":{\\"name\\":\\"subject\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Rat\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"checked\\":{\\"name\\":\\"checked\\",\\"fetchMode\\":\\"AUTO\\"},\\"color\\":{\\"name\\":\\"color\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"mandatory\\":{\\"name\\":\\"mandatory\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false}"}],"position":"0"},{"metaClass":"report$BandDefinition","id":"57248120-8d67-7f95-16f3-0a73fb562e8d","orientation":"0","childrenBandDefinitions":[],"name":"Employees2","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"ceb6e5ec-46c1-1148-2d2e-ee19fc7b7f60"},"report":{"metaClass":"report$Report","id":"abe22d13-565a-e0a1-e8bb-ee60deba29a6"},"dataSets":[{"metaClass":"report$DataSet","id":"a391cb8e-f0e4-0a59-78d6-ef1dec401382","type":"50","jsonSourceType":"10","name":"Dataset","listEntitiesParamName":"entity#participants","useExistingView":"false","bandDefinition":{"metaClass":"report$BandDefinition","id":"57248120-8d67-7f95-16f3-0a73fb562e8d"},"text":"return [[:]]","view":"{\\"entityClass\\":\\"ratlab_Research\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"description\\":{\\"name\\":\\"description\\",\\"fetchMode\\":\\"AUTO\\"},\\"startTime\\":{\\"name\\":\\"startTime\\",\\"fetchMode\\":\\"AUTO\\"},\\"state\\":{\\"name\\":\\"state\\",\\"fetchMode\\":\\"AUTO\\"},\\"title\\":{\\"name\\":\\"title\\",\\"fetchMode\\":\\"AUTO\\"},\\"participants\\":{\\"name\\":\\"participants\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Employee\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"position\\":{\\"name\\":\\"position\\",\\"fetchMode\\":\\"AUTO\\"},\\"homeAddress\\":{\\"name\\":\\"homeAddress\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Address\\",\\"name\\":\\"\\",\\"properties\\":{\\"country\\":{\\"name\\":\\"country\\",\\"fetchMode\\":\\"AUTO\\"},\\"field1\\":{\\"name\\":\\"field1\\",\\"fetchMode\\":\\"AUTO\\"},\\"field2\\":{\\"name\\":\\"field2\\",\\"fetchMode\\":\\"AUTO\\"},\\"field3\\":{\\"name\\":\\"field3\\",\\"fetchMode\\":\\"AUTO\\"},\\"field4\\":{\\"name\\":\\"field4\\",\\"fetchMode\\":\\"AUTO\\"},\\"field5\\":{\\"name\\":\\"field5\\",\\"fetchMode\\":\\"AUTO\\"},\\"latitude\\":{\\"name\\":\\"latitude\\",\\"fetchMode\\":\\"AUTO\\"},\\"longitude\\":{\\"name\\":\\"longitude\\",\\"fetchMode\\":\\"AUTO\\"},\\"town\\":{\\"name\\":\\"town\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"laboratory\\":{\\"name\\":\\"laboratory\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Laboratory\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"code\\":{\\"name\\":\\"code\\",\\"fetchMode\\":\\"AUTO\\"},\\"title\\":{\\"name\\":\\"title\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"resources\\":{\\"name\\":\\"resources\\",\\"view\\":{\\"entityClass\\":\\"ratlab_ResourceRequirement\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"amount\\":{\\"name\\":\\"amount\\",\\"fetchMode\\":\\"AUTO\\"},\\"consume\\":{\\"name\\":\\"consume\\",\\"fetchMode\\":\\"AUTO\\"},\\"mandatory\\":{\\"name\\":\\"mandatory\\",\\"fetchMode\\":\\"AUTO\\"},\\"provided\\":{\\"name\\":\\"provided\\",\\"fetchMode\\":\\"AUTO\\"},\\"resource\\":{\\"name\\":\\"resource\\",\\"view\\":{\\"entityClass\\":\\"ratlab_MiscResource\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"consumable\\":{\\"name\\":\\"consumable\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"type\\":{\\"name\\":\\"type\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"subjects\\":{\\"name\\":\\"subjects\\",\\"view\\":{\\"entityClass\\":\\"ratlab_SubjectRequirement\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"subject\\":{\\"name\\":\\"subject\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Rat\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"checked\\":{\\"name\\":\\"checked\\",\\"fetchMode\\":\\"AUTO\\"},\\"color\\":{\\"name\\":\\"color\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"mandatory\\":{\\"name\\":\\"mandatory\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false}"}],"position":"1"},{"metaClass":"report$BandDefinition","id":"cba49a30-21c1-2e99-8e50-5344172d0a9a","orientation":"0","childrenBandDefinitions":[],"name":"ResourceRequirements3","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"ceb6e5ec-46c1-1148-2d2e-ee19fc7b7f60"},"report":{"metaClass":"report$Report","id":"abe22d13-565a-e0a1-e8bb-ee60deba29a6"},"dataSets":[{"metaClass":"report$DataSet","id":"e975f448-8abf-5251-027b-1ad32958aebd","type":"50","jsonSourceType":"10","name":"Dataset","listEntitiesParamName":"entity#resources","useExistingView":"false","bandDefinition":{"metaClass":"report$BandDefinition","id":"cba49a30-21c1-2e99-8e50-5344172d0a9a"},"text":"return [[:]]","view":"{\\"entityClass\\":\\"ratlab_Research\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"description\\":{\\"name\\":\\"description\\",\\"fetchMode\\":\\"AUTO\\"},\\"startTime\\":{\\"name\\":\\"startTime\\",\\"fetchMode\\":\\"AUTO\\"},\\"state\\":{\\"name\\":\\"state\\",\\"fetchMode\\":\\"AUTO\\"},\\"title\\":{\\"name\\":\\"title\\",\\"fetchMode\\":\\"AUTO\\"},\\"participants\\":{\\"name\\":\\"participants\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Employee\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"position\\":{\\"name\\":\\"position\\",\\"fetchMode\\":\\"AUTO\\"},\\"homeAddress\\":{\\"name\\":\\"homeAddress\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Address\\",\\"name\\":\\"\\",\\"properties\\":{\\"country\\":{\\"name\\":\\"country\\",\\"fetchMode\\":\\"AUTO\\"},\\"field1\\":{\\"name\\":\\"field1\\",\\"fetchMode\\":\\"AUTO\\"},\\"field2\\":{\\"name\\":\\"field2\\",\\"fetchMode\\":\\"AUTO\\"},\\"field3\\":{\\"name\\":\\"field3\\",\\"fetchMode\\":\\"AUTO\\"},\\"field4\\":{\\"name\\":\\"field4\\",\\"fetchMode\\":\\"AUTO\\"},\\"field5\\":{\\"name\\":\\"field5\\",\\"fetchMode\\":\\"AUTO\\"},\\"latitude\\":{\\"name\\":\\"latitude\\",\\"fetchMode\\":\\"AUTO\\"},\\"longitude\\":{\\"name\\":\\"longitude\\",\\"fetchMode\\":\\"AUTO\\"},\\"town\\":{\\"name\\":\\"town\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"laboratory\\":{\\"name\\":\\"laboratory\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Laboratory\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"code\\":{\\"name\\":\\"code\\",\\"fetchMode\\":\\"AUTO\\"},\\"title\\":{\\"name\\":\\"title\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"resources\\":{\\"name\\":\\"resources\\",\\"view\\":{\\"entityClass\\":\\"ratlab_ResourceRequirement\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"amount\\":{\\"name\\":\\"amount\\",\\"fetchMode\\":\\"AUTO\\"},\\"consume\\":{\\"name\\":\\"consume\\",\\"fetchMode\\":\\"AUTO\\"},\\"mandatory\\":{\\"name\\":\\"mandatory\\",\\"fetchMode\\":\\"AUTO\\"},\\"provided\\":{\\"name\\":\\"provided\\",\\"fetchMode\\":\\"AUTO\\"},\\"resource\\":{\\"name\\":\\"resource\\",\\"view\\":{\\"entityClass\\":\\"ratlab_MiscResource\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"consumable\\":{\\"name\\":\\"consumable\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"type\\":{\\"name\\":\\"type\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"subjects\\":{\\"name\\":\\"subjects\\",\\"view\\":{\\"entityClass\\":\\"ratlab_SubjectRequirement\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"subject\\":{\\"name\\":\\"subject\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Rat\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"checked\\":{\\"name\\":\\"checked\\",\\"fetchMode\\":\\"AUTO\\"},\\"color\\":{\\"name\\":\\"color\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"mandatory\\":{\\"name\\":\\"mandatory\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false}"}],"position":"2"},{"metaClass":"report$BandDefinition","id":"f7ed0548-27e8-3801-4819-8cf6d48441d6","orientation":"0","childrenBandDefinitions":[],"name":"SubjectRequirements4","parentBandDefinition":{"metaClass":"report$BandDefinition","id":"ceb6e5ec-46c1-1148-2d2e-ee19fc7b7f60"},"report":{"metaClass":"report$Report","id":"abe22d13-565a-e0a1-e8bb-ee60deba29a6"},"dataSets":[{"metaClass":"report$DataSet","id":"f02104bd-a560-1808-42a2-dc375e3936d2","type":"50","jsonSourceType":"10","name":"Dataset","listEntitiesParamName":"entity#subjects","useExistingView":"false","bandDefinition":{"metaClass":"report$BandDefinition","id":"f7ed0548-27e8-3801-4819-8cf6d48441d6"},"text":"return [[:]]","view":"{\\"entityClass\\":\\"ratlab_Research\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"description\\":{\\"name\\":\\"description\\",\\"fetchMode\\":\\"AUTO\\"},\\"startTime\\":{\\"name\\":\\"startTime\\",\\"fetchMode\\":\\"AUTO\\"},\\"state\\":{\\"name\\":\\"state\\",\\"fetchMode\\":\\"AUTO\\"},\\"title\\":{\\"name\\":\\"title\\",\\"fetchMode\\":\\"AUTO\\"},\\"participants\\":{\\"name\\":\\"participants\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Employee\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"position\\":{\\"name\\":\\"position\\",\\"fetchMode\\":\\"AUTO\\"},\\"homeAddress\\":{\\"name\\":\\"homeAddress\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Address\\",\\"name\\":\\"\\",\\"properties\\":{\\"country\\":{\\"name\\":\\"country\\",\\"fetchMode\\":\\"AUTO\\"},\\"field1\\":{\\"name\\":\\"field1\\",\\"fetchMode\\":\\"AUTO\\"},\\"field2\\":{\\"name\\":\\"field2\\",\\"fetchMode\\":\\"AUTO\\"},\\"field3\\":{\\"name\\":\\"field3\\",\\"fetchMode\\":\\"AUTO\\"},\\"field4\\":{\\"name\\":\\"field4\\",\\"fetchMode\\":\\"AUTO\\"},\\"field5\\":{\\"name\\":\\"field5\\",\\"fetchMode\\":\\"AUTO\\"},\\"latitude\\":{\\"name\\":\\"latitude\\",\\"fetchMode\\":\\"AUTO\\"},\\"longitude\\":{\\"name\\":\\"longitude\\",\\"fetchMode\\":\\"AUTO\\"},\\"town\\":{\\"name\\":\\"town\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"laboratory\\":{\\"name\\":\\"laboratory\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Laboratory\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"code\\":{\\"name\\":\\"code\\",\\"fetchMode\\":\\"AUTO\\"},\\"title\\":{\\"name\\":\\"title\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"resources\\":{\\"name\\":\\"resources\\",\\"view\\":{\\"entityClass\\":\\"ratlab_ResourceRequirement\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"amount\\":{\\"name\\":\\"amount\\",\\"fetchMode\\":\\"AUTO\\"},\\"consume\\":{\\"name\\":\\"consume\\",\\"fetchMode\\":\\"AUTO\\"},\\"mandatory\\":{\\"name\\":\\"mandatory\\",\\"fetchMode\\":\\"AUTO\\"},\\"provided\\":{\\"name\\":\\"provided\\",\\"fetchMode\\":\\"AUTO\\"},\\"resource\\":{\\"name\\":\\"resource\\",\\"view\\":{\\"entityClass\\":\\"ratlab_MiscResource\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"consumable\\":{\\"name\\":\\"consumable\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"},\\"type\\":{\\"name\\":\\"type\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"subjects\\":{\\"name\\":\\"subjects\\",\\"view\\":{\\"entityClass\\":\\"ratlab_SubjectRequirement\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"subject\\":{\\"name\\":\\"subject\\",\\"view\\":{\\"entityClass\\":\\"ratlab_Rat\\",\\"name\\":\\"\\",\\"properties\\":{\\"id\\":{\\"name\\":\\"id\\",\\"fetchMode\\":\\"AUTO\\"},\\"version\\":{\\"name\\":\\"version\\",\\"fetchMode\\":\\"AUTO\\"},\\"createdBy\\":{\\"name\\":\\"createdBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"createTs\\":{\\"name\\":\\"createTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updateTs\\":{\\"name\\":\\"updateTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"updatedBy\\":{\\"name\\":\\"updatedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"deleteTs\\":{\\"name\\":\\"deleteTs\\",\\"fetchMode\\":\\"AUTO\\"},\\"deletedBy\\":{\\"name\\":\\"deletedBy\\",\\"fetchMode\\":\\"AUTO\\"},\\"checked\\":{\\"name\\":\\"checked\\",\\"fetchMode\\":\\"AUTO\\"},\\"color\\":{\\"name\\":\\"color\\",\\"fetchMode\\":\\"AUTO\\"},\\"name\\":{\\"name\\":\\"name\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"},\\"mandatory\\":{\\"name\\":\\"mandatory\\",\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false},\\"fetchMode\\":\\"AUTO\\"}},\\"loadPartialEntities\\":false}"}],"position":"3"}],"name":"Root","report":{"metaClass":"report$Report","id":"abe22d13-565a-e0a1-e8bb-ee60deba29a6"},"dataSets":[],"position":"0"},{"metaClass":"report$BandDefinition","id":"494d0786-818f-e350-471d-ac6cbdf7cddf"},{"metaClass":"report$BandDefinition","id":"57248120-8d67-7f95-16f3-0a73fb562e8d"},{"metaClass":"report$BandDefinition","id":"cba49a30-21c1-2e99-8e50-5344172d0a9a"},{"metaClass":"report$BandDefinition","id":"f7ed0548-27e8-3801-4819-8cf6d48441d6"}],"inputParameters":[{"metaClass":"report$ReportInputParameter","id":"455256b8-a901-f2cb-826b-1378b6765205","lookup":"false","entityMetaClass":"ratlab_Research","predefinedTransformation":"","type":"30","required":"true","validationOn":"false","defaultDateIsCurrent":"false","report":{"metaClass":"report$Report","id":"abe22d13-565a-e0a1-e8bb-ee60deba29a6"},"name":"Research","alias":"entity","position":"1"}],"validationOn":"false","reportType":"10","reportScreens":[],"group":{"metaClass":"report$ReportGroup","id":"4e083530-0b9c-11e1-9b41-6bdaa41bff94","localeNames":"en\\u003dGeneral\\nru\\u003dОбщие","code":"ReportGroup.default","title":"General","version":"0"},"inputEntityTypesIdx":",ratlab_Research,","valuesFormats":[],"templates":[{"metaClass":"report$ReportTemplate","id":"b5f9d089-2a2b-dff6-4f56-9755d3bfcadb"}],"version":"2","system":"false","name":"Report for entity \\"Research\\" (2)"}	\N	\N	,ratlab_Research,	\N	f	\N
\.


--
-- TOC entry 3526 (class 0 OID 37016)
-- Dependencies: 215
-- Data for Name: report_template; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.report_template (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, report_id, code, output_type, is_default, is_custom, is_alterable_output, is_groovy, custom_defined_by, custom_class, output_name_pattern, name, content) FROM stdin;
87252193-f0e3-d4ca-e288-d38072ca94f1	2021-03-04 11:42:57.805	admin	1	2021-03-04 11:42:57.805	\N	\N	\N	aaeea142-c520-6936-4488-aa0cceaaa504	DEFAULT	50	f	f	f	f	100	\N	Rat list.xlsx	Template for report "Rat list".xlsx	\\x504b03041400080808005c5d6452000000000000000000000000130000005b436f6e74656e745f54797065735d2e786d6cb5923d4ec4301085af62b945b1b31408a1245b2c500212cb0106679258f19f3cde25b93d4e020d828262abb1e7bd79df5872b59fac61678ca4bdabf94e949ca153bed5aeaff9dbf1b1b8e58c12b8168c7758f31989ef9bea38072496671dd57c4829dc49496a400b247c409795ce470b295f632f03a8117a94d76579239577095d2ad292c19bea1e3b3899c41ea6dcdef6886888b3c3665c583587108c5690b22ecfaefd4129be08224fae1e1a74a0ab6ce0b2a99ef303a36ef15f89beebb4c2d6ab93cd238242446869404cd6084ab3c12d9fbd404c4f6073a29c8cdc147139f2528505ed7ea37ff838be7b3f5e8ebf10d6f35ff85524f9ba94ddf71e72fd30cd27504b0708817a964b020100006f020000504b03041400080808005c5d64520000000000000000000000000b0000005f72656c732f2e72656c738d8fcd0e82301084ef3c45b377297830c650b81813ae061fa096e527946ed35685b7b747311edcdb6467bec914d5326bf644e7473202f234038646513b9a5ec0adb9ec8ec07c90a6959a0c0a58d1435526c515b50c31e387d17a1621c60b1842b027cebd1a70963e258b267e3a72b30c51ba9e5ba926d923df67d981bb4f0694098bb701b346ba1e838045f317b9e94e34a59108ac592dfed3475d372a3c937acc68c28fda2f07b0ba15e0ea36071e57f2cdcc327903504b0708bf1ab902b60000002f010000504b03041400080808005c5d64520000000000000000000000000f000000786c2f776f726b626f6f6b2e786d6c9d935d4fc3201486eff72b2ae9ed46db19339bb68bc962b20b8df1eb9ec1e94a56a001e6e6bf977e993acdd2d91be0c0fbf43d8743b23c8ad2fb006db892290a6701f24052c5b8dca6e8edf57eba409eb14432522a0929fa048396d9243928bddb28b5f39c5e9a1415d65631c68616208899a90aa4dbc99516c4baa5de62536920cc14005694380a821b2c0897a825c4828e8108a277fb6a4a95a888e51b5e72fbd9b07a8c1e435179ce29ac14dd0b90b6f5a2a17444254dc12bd3d38e6c148f69727005ebd31a64ba6a777a1ef9076d5824e727bcfec5109c6a65546e67ae2e5d72188e146a42189cf33396d6796a794347d22c2ef373929134b717ea17386a09d9c4735f5277e13b878369d74dacefce3a8ebb73f8e460d21464a86a029e24c2f5f94b3d0f5defd7e39ab9a7813c1d7337d16b16a26fe8109230c8b904f6e80843ee20dcd10b771fa09fdd8da3acfdd3957fe747b1bff2a3040fce9fa59ceae7b57efe87fe47a8374b49499fb4570f0f8a391cd95b552796e0be7cd9e40b504b07085a5a43187f01000020040000504b03041400080808005c5d64520000000000000000000000001a000000786c2f5f72656c732f776f726b626f6f6b2e786d6c2e72656c73ad904d6bc3300c86eff91546f746490fa58c38bd8c41af6df6038ca37cd0c43696fa917f3f974259618c1da68b1042cffba06a779b2775a1c8a3771acabc0045cefa7674bd86cfe663b505c5625c6b26ef48c3420cbb3aab0e341949373c8c81558238d63088843744b603cd86731fc8a54de7e36c248db1c760ecc9f484eba2d860fcce803a53a95ec0aa31b127d170f5f1c40391301eefadcc131754b304fa4baaefbad1d2bbb7e7999cfc108ecf0050fb5643dcb725e06f462ccb44fcdf1a0fead3617d77a8f0e5d775f605504b07080d79d181cd000000b4010000504b03041400080808005c5d645200000000000000000000000018000000786c2f776f726b7368656574732f5368656574312e786d6cad95cb6ea3301440f7f90a6475db988474945690aa0daa349b59cd68d6aeb92956b08d7c9d4755cdbf8fc1d0a2b4aa9c0836e007e7dc8711e9fd5156d11e0c0aad32329bc62402c57521d44b46fefc7eba5e92082d5305abb4828cbc0292fbd5243d68b3c512c0460ea03023a5b5f51da5c84b900ca7ba06e55636da4866ddd0bc50ac0db0a27d4956741ec73fa86442114fb8933c042299d9eeea6bae65cdac781695b0af2dabc798108ade6c04875cf39d04657d2c062a47d40a4b51634f3b1641bcc2b083ab589fd620d3dcaff43c76016d582417cf6cf1892105371af5c64e5d5dbae4281c39348459fc5d3ca1b42e26cf1b46a470795e3c271929bc3df3fd259d7bc26a12b92be5ba42ffd80f23299ac34c22c98eedfd200a5b6624899bf3fd0c689f84cd88353b2011dfa1d5f2afdfd14ed1af68f38e361f859674b46414daa2a32d46a1dd74b49b0b6929fde848ea0f1db36c6032fa1099a6921f733e8266f6c11518dba639135a73b2a9ddb85ffd621252ba3f01503eb050a709953e0649d7bad26644eb3acc5a02df4231a2370ff2fecc2f52265f773509515ebd29d7d77f237a1f03bdbc69ed98e275a8d877774c751ea8166758533af89053fafef75f4dfe03504b0708e489b03bc501000042080000504b03041400080808005c5d645200000000000000000000000023000000786c2f776f726b7368656574732f5f72656c732f5368656574312e786d6c2e72656c738dcfb10ac2301006e0bd4f116e37691d44a4691711ba4a7d80905cd3629b845c14fbf66670b0e0e06dc771dfcf5fb7af65664f8c347927a1e2253074da9bc95909b7feb23b02a3a49c51b37728614582b629ea2bce2ae51f1aa7402c238e248c29859310a4475c14711fd0e5cbe0e3a2525ea31541e9bbb228f6657910f1db80a660793630eb55b49824702e28ad3312cf1eb07e0df84f9a1f8649e3d9ebc7822efd08fda8c03a232176a60291bb894db9a67803504b07088347e8e9b400000025010000504b03041400080808005c5d64520000000000000000000000000d000000786c2f7374796c65732e786d6cbd964d6fe2301086effc0acbf7624055c556844a5555692f7bd8b2d25e8d3321def547649b92f4d7ef244e200458c1aa5a4ef64cfccc3b1f4e583c955a9177705e5a93d0e9784209186153693609fdb17abd9b53e203372957d640422bf0f469395af8502978cb01024182f109cd43281e19f32207cdfdd81660d09359a779c0addb305f38e0a9af0f69c56693c903d35c1a1a098f5a5c03d1dcfdde1677c2ea8207b9964a86aa617518770dc5669914f062c5568309518b0385446b7c2e0bdfd1caf42a5eeaf80e4bd6a5d5cbf4257a3a1eff075abf48a8677a7fc2d05238eb6d16c65897363906a5809a309dfc4dcfb5b45653e4f515193fbf4dcf2023e3bfdc787ece6691b01c11fc2d326b8227c26e4dc0116ead7bcf61db98fc0779e70a9f9be1acb3815358651d0928026ad2d06db886787a253578f20d76e4bbd5dcf49f5cb043d4b8f69d4ea9d4059de819c4c2e90ee0cc2b7a48bb5e5505ca32780f07f1f6a7e3ba8bb7b62ec59bdd459cf52346df20a6822c0c737672939f18832d86a6b50d017bd5d7358c713928695e27090df9beab67fa224d0a25a4097db83f690dab31e7a47f02bae19c56e013c848395bc64f4047d0a57674bb6e54f066a9b73ae6cfecfc849619a947f92b46c34f443d65ed3272e28675f03eae17a1079fdd0c27651617834cb9921b53bfc5496e9dfc404e7d417f6d7d905945eb6f5b90e2c8b473bc5841892a82db0eee5299dda66b7ad0457851a8eab971b5e8ff223596fbb8d24df1cf7772ef26f5eb2ca1ba6a76bd3cd65ba98234ed4ea016ab9fa3ed5847afd1187cc10e7f0a96a33f504b0708e891b54b4e0200005a080000504b010214001400080808005c5d6452817a964b020100006f0200001300000000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b010214001400080808005c5d6452bf1ab902b60000002f0100000b00000000000000000000000000430100005f72656c732f2e72656c73504b010214001400080808005c5d64525a5a43187f010000200400000f0000000000000000000000000032020000786c2f776f726b626f6f6b2e786d6c504b010214001400080808005c5d64520d79d181cd000000b40100001a00000000000000000000000000ee030000786c2f5f72656c732f776f726b626f6f6b2e786d6c2e72656c73504b010214001400080808005c5d6452e489b03bc501000042080000180000000000000000000000000003050000786c2f776f726b7368656574732f5368656574312e786d6c504b010214001400080808005c5d64528347e8e9b40000002501000023000000000000000000000000000e070000786c2f776f726b7368656574732f5f72656c732f5368656574312e786d6c2e72656c73504b010214001400080808005c5d6452e891b54b4e0200005a0800000d0000000000000000000000000013080000786c2f7374796c65732e786d6c504b05060000000007000700d10100009c0a00000000
6d33b9e3-89ed-6a43-52e9-4f46dba9f40a	2021-03-04 11:44:27.124	admin	1	2021-03-04 11:44:27.124	\N	\N	\N	a57d1d4b-8a62-9738-866a-ad8ac84477bd	DEFAULT	40	f	f	f	f	100	\N	Report for entity "Rat".docx	Template for report "Report for entity "Rat"".docx	\\x504b03041400080808008d5d6452000000000000000000000000130000005b436f6e74656e745f54797065735d2e786d6cb593cd4ec33010845fc5f215252e1c1042497ae0e7083d9407b0ec4d6be13f79b7a57d7b3609eda1e500aa7a4b32b3f3cd3a4933df052fb650d0a5d8cadb7a26054493ac8bab567e2c5fab07299074b4daa708addc03ca79d72cf71950f06cc456ae89f2a35268d61034d6294364a54f2568e2dbb252599b4fbd0275379bdd2b932241a48a860cd935cfd0eb8d27f1b2e3c7538f021ea5789a8c03ab953a67ef8c26d6d536da134af543a87972f4e0da65bc6183545df3ce0b1667e15f89a9ef9d019bcc26f0480d433b0bb6ca858d851c4cf162a10bbde9c0818acd0b565171747d09fbb08d4905fe041c8c17114fb6fd4ac532d700227f09c1d747256817cf7a0c7675b45cb30702115f9d1fc558e1a05eb702edfd2fef622a306a07bc1a7f93ee1b504b070816e55e422301000065030000504b03041400080808008d5d64520000000000000000000000000b0000005f72656c732f2e72656c73ad92414bc4301085effd1561eedb74571091a67b11616f22f5070cc9b40db699908cbafbef8da2e0ca2a2b38b730f3defb78a4ddee97593d53ca9e838175dd80a260d9f9301a78e86f5757a0b260703873200307cab0edaaf69e6694a2c9938f591593900d4c22f15aeb6c275a30d71c2994cdc0694129cf34ea88f61147d29ba6b9d4e9ab0774952a7364ac7a4c238981174e4e3bb64f0b05a98b27a8fe10e99c441e066fe9e6437b22f8db05a89d3390766e0dfa37a4427397b8c82d27fa1bd2cf25e885041d0abebbae6209a024be74fe49b539930a63fcef9e682f141cb95358176f58ad3efa155df50a504b07086ddead65ec0000005e020000504b03041400080808008d5d645200000000000000000000000011000000776f72642f646f63756d656e742e786d6ced594b73db3610befb57a04a0fed410269c9b2acb194516dc7896b271e3b6d72eb80202cb22609068044a99dfef72e49f14d2624dbc925f1412288c587dd0ffb827cfe72e73a68cb84b4b9b718e8236d809847b9697bebc5e0b7f7af86b301928a782671b8c716833d938397cba3f3606e72ba7199a7102078721e2c069652fe1c63492de61239e23ef360ee890b9728188a350eb8307dc129931236701d7cac6953ec12db1b2430fa4905c8b5a9e0923fa911e52ee64f4f366511142cd78fa327d7c90026dd00b412806863488c7179a0203643308728a0515ab62f1334d206cd142468e083b435e780115b944770fbda039356caaadfc38ee2695fc6931962bf836a0474691b155d229e37fe10e07d382cc3766cb58fb44d60a4d306269ebab50d41c4bec68bc350e960db81accc095bd952a29b5a44a814c06ce5c77510255e69770fd44ef10c1f171532d7ad1cb1a4906993b5206e02e2db7d8881556a235802b2eb458df40523a6b4182b1364ca6a707c89a059d9b2ed62b011defcb07e98ae0f3d75becd1c837f4e2edee7f0959a0bab5b2c623bca7249546bb12474d9f464daede2f380099fdb5ee6a8be5f3d8e5afa620fe550aceec99add0b9e65596eee528cf0284df8880e7107516ee5c468bd18e59e6947b93b13fd542ffa69c3644992d44b124f82b13939bb6973d787daeaa99c682e580ab28f90bfd44a287c4914796d33483fd4da27eb8cbea9deb00dc7e6e08f7e06e6428e7dfec2c98044b5e040eae955b4ea934fcb762087544a3c54f64578547b270d234f8e6729501004a3601cd1a99f9dcdf01d7859f471779b933fab9307bec7f88df79c49127d4c5db3b392e388f4d07b5c68cf526b779d8126b1b56c97913eed0b92cbf6fa54d73bc34cb1ae975323d54fc79d814e31d05c5089b8e3ee249f62979bcc19a7fc124f9f754699412eb0dda839cc707ae993432a6b6613aadae16549383e3988e215cd2ba72cb76ddc299863518d84a829b4407ecbb86b6aef1e2de2b30cad5af83ba15d106f4b6406b7fe6f70d7826ffcac5a4e65b77e4f3f39f47b58eedd2cf00088da2d9d22414a3a470c2b531ca65ab6240133d84e312fbcfe49ac887cf689c7646cb2ae67807de0f2a3326258f4fa34a8f9be3dc172fa34850ea7cfcc2cba4598b5fa54ae52c222bd8a563e78a063eda548a9d385444e5ac64d359563423383fa1484e235b67735c8c3c465e5b80fd071f594a672db320d14a01e7fbf2eda66b2ee249f6258c505f8f296651acdacee48336ced7d261cc8e2943b5ce42ed8bd7e4aa95eb0974708fece83b9c1cdfdf2fc87e1105dc065483113197b6472ba9bfc8966237d34453fad7c025b2107703dc9cc9fd12644420f57afae1eaede5e5ca19bd5c75f90eda115f4b4ea1d84e9cde5afe8866c09d247b391f6c7f1f404710fdd118ade3da28f68388cb73fa8e067a3c31b517c7378ab96e738fc2c4ae3827838f40be8ca702af8f0eebe610fc3895a4414ccb7046e3fef89e1b06b01791837c97f00d96031d006f0ade0d81603b251bc59fe96f3e7045e9bacb4b264646455c17871a84a2df01a262eb813eb32d6b4b30605fe37b9839a558542451bc8a5d5d7e954dd8114043ee47449a93677a4ce8054c146d8aadf95663fa34ea2d2f2c50b03faf4c503d423f496b8acc63fcb1a35a9836bf5896df836c8bc0833dd77061b66db30f8e6f2abd017bdabc94edf48d0fff837dcf3d83fdf3db561b61d87515ff39dc4a60ddb91689b5f87c172c41f6a7fa1cf928caa9a9ec55f3ffe1553a7eb67da69c89d05cfd3d938e291721378ac3617e1c23b2242a6395c2af5c924eaaf84bdb6543634b852dccdc60e7b4a667151dbbc76e1386a7b8fc2a7e47f9ecba37f01504b070848ac59bb44050000391d0000504b03041400080808008d5d64520000000000000000000000001c000000776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c73ad90cb0ac2301045f7fd8a307b9bea42449a7623825ba91f10d2e903db246446b17f6f4411051117ce6e18e6dcc3cdcbcb38883306ea9d55304f3310688dab7bdb2a3854dbd90a04b1b6b51e9c45051312944592ef71d01c7fa8eb3d8908b1a4a063f66b29c974386a4a9d471b2f8d0ba3e6b886567a6d8eba45b9c8b2a50caf0c281211e70d2c2a1d5a6405c4d380944618886af2f84b946b9adee0c699d388963f24ca3b15c4ae561076f51ce45707648eadfcdfe2c17d7a2c6e1eb97c6bb848ae504b0708cef3638ac2000000aa010000504b03041400080808008d5d64520000000000000000000000000f000000776f72642f7374796c65732e786d6ced5b5957e338167eef5f919377cab11db2702add87a528ea9caa1e6642f53c2bb6c01a6ccb252904fad7f79577cb72629b24d54cc303245a3e5d5d7d7793cdc7df9e037ff0841927345c0ccd0fa3e100870e7549f8b0187ebfbb3e990d075ca0d0453e0df162f882f9f0b75f7ff9b839e3e2c5c77c00f3437eb6590c3d21a233c3e08e8703c43fd00887d0774f5980047c650fc686323762d4c19c037ce01bd66834310244c26106639ed68002e230cae9bdf8e0d0c0a0f7f7c4c131144c37adf853e01700e36e00230580b5d9488271459d758043916c83611f095022f748c43334d406cd6568d3a00fd4763b2946b2a33242d0773fd0e9e55a8d7aeca37ada57496781d8efa01a0103a78d8801628febe804e02338ac15f1897889a5cd60b8df0626e9fa4a560cb1170d8ba5a174d85baaac8284adf6a2a8dbf110133980db8ac73a0845af4e77068ea6c6ccb0aa02b90fad88a808e412f4c050908144a48f62609658339c813cf7520d8f18462ef7305615e4f2ba71ec52d04cddd9d362b866e1593aff249f2f997af65410836e1b97ac93fec9b70bb35b4cc2cf0e2e39d1518b2992b2f9c9b45b25a21bcc224ac282a851543f0eadfa1286520855b7e801df325a7859ea3ee718f2285df8151fe23358b9571ae6e88739347449ecbb8ba13ff4437fac31574622fd481472d86c691c695a3c8820b286a234b4642c95b14bf05fe29c09e30a09744330b81fc77bc9e6adfabafa1559f984021fa3022c001ffbb8e36460443de080ebe915b4f4cea7653a5042521c8fc3fb222c657e93c184dc9ee5409bcde6c3c68ed569cee733e31bb02cfef5ed6b69fc5c371ef46d1b5fc2c76224326d27703b0b69c74a97ec092039cb77fbdc19689cec163f174a9ff40529797b73629a9d61268669aaaed131a77667a0a9016aae888402bbbb92a746405decdbb97e5168ce3aa3ccc01790204e0e0b9c5ef2949054c90872443bbcc209272707567cee9485135ed0d6ee04f4e1384682d55452a0a8a5dd35a5774b0f45b840ab07fe4e6897287c42bc807b781ddc6746d751112d27bc5bbe679ea6f99ec15f82c2f000c8212d4991216599a30133731c2c5aa6241bbcc2cf0287b2f8e38640fc314221e6c9964db300ec0357fea622caa0d727412de7ed1996df2729f4a9f388dd2a2da4d7ea13b91487857a05adb2f140c6da4b1025d305478e5ada4ddd951bc82936d4272054cbd8ded1a00c938415ab0f90553fa5097f6ae9062a50cb3f3e57f7e6e2ee4a9e1a308b32e0f2132e249a79dd916686f71261e6831777a84f59a9c0ee7595522fb07ffd65003f1f37672e75aef03d5afb82276d693bbb65697bd15c7455dbb2f66b0a09ef607386b843c89d8c228b614042ca6ecec1610ca1c7931fb43d187171ce09d2763a5c949a2f884b86865604fe278c7e4250b65856e3904bbe73908fc2876c100e4fbe2fcb22969a56445600889d2ccf55a48f86a2a9b4a1a655582e6a5676d4a06c1e2187c442a27b81a1dc020f282502ce809eace924fbf29fb50f0d682da84ec24895501545b6d538126b08a240924e4b75baf8fe6bec7d97023a16c37be4733c4c3abe7fb9658432f0ee8be17c9e362e71406e88ebe27031146c9d8f0d3de2e2ff7a38fcceb15be9faf775ecf94bd80e5d87f0dd9a4c871575fadcfd04a56f24f31f1806691948f4bb9cedcb696b52c813eb8c9764c9c1d78a2479c78f4c8e583663f7ca1e46f2e67560aa8bcf8fb8b8a55dbc379cbd5fb8f17ee0ee88f0b10a651ee38c53fb18dc2286e29a7b209d614d943650cbf54a68f7611e611f9f82c8439c707571eb184abc432b1f0f3e3399f556973fed6a2a46e1bdca9e2a775ff1730e982d20ce2e8651766af12ab2eb8b5bf6186e72bae94e2a1b91926791229d50dd69aa856a23e3c4cd668d46e373db9a4ecb32c7327412f626b124b359bac20d55655921d0dbbfc2ad9b0821e9df3a40a62ad9804c944b48399561c5996683e7ddd5351b9b9757eabc5a9c84b6478ca3df417235ee253d5f89ac8a6a5d45605d61a83540e1e3d9a8163a3767742d6478fdfae4e7925544aa05574de2d49834a1ff35254d951e3569929d9fd2b66ade247b7479933c7f4dd3a5463171269aedd59e9c5ecf638714af7029fb20cb701c30b5a219ea7d1756bfb8d62c5b4ad566daee529a3653359b6bf255c662ed3616eb48c662f53296aaeffbdb1b924c51db1892f90f32a4f1f5ccbcb86a32a4ad6633d9653693c3988dbddb6cec23998dfd6e3685d958ef6653379bfdd17ebc9bf6e323d17efc4efb82f6f6ff37ed89a6e9279987bc43468ec0ac621e69e99b57be59e1dbb2686aa89c77915bad628adab005e9fbfb01d8fb562f8055b36ce302540bc7ac9d7d7731f09eb62cd08a571b8b8e0c4e922ae1444439706f52af97ea931879f0443e676e4feac66ea8cb578cbb1f594bea9586bae68206f1d5c02e9a2613079a83514e586b0ebbcebbfb596f3bcffeaac9cbf6eeca89af160ea39ff85ea36bb46b41f8b71d18de643dbe957ad62ba8671d8c7aea15c03bf5de4205bb9568f62b88661f8c686ad1fc4eb49f97d4560aad7e44191f8c286a99f94e94bf5395b4ed61d297100a14b1eb09d2201dd6bd92f839450209e52c1fdf43b137b59a1f83f4d35cfe3cb4516bf98803dfbe64ebb4aace4c3565dde7154bb80e1ade0b217ec33d7a76009aa9ca11ce6a51f76ddca81cd607a4938b7baa44c5a7db339cb1b6bb94e18cf71cb82a1ced16b8b2a9fb8f5b0d06dac268de6ce0fa879151efbaefb6fbedbb6338edbbf61e7b74408f1d5db87a87bda2020c344394ef68fae9cb6df1e16fa78454f69fe0b1e30f4006f9b682cee9d757afb0277d85d0d6deb83b604aa0f035f297c98437191c2a76664eedc9694da9729756bbbb92aadde9ccee11b39cc40d172af9f4da5ba88a5d9ed69eecbd3248dcf58c107787090f3a3fd0c23cdf6c6c78e762898bf91b878daccb47bc9673754e593d5cfe9569cea7572d88b63305d8c73d45f67f025bee23f221fbd75fb7ea52a3a38a298ce0e7fa5a35054f277fb69c1237fb2a57c8374fab2e52b6c4afa2367bc3e275d5ad9a8dc7b52cd74fdbe412b5c05d7ef37f9c7fd1bff9af0bd962e5eb9efdade47d05806dd215125db9cf48731230f8823217b386c785346a4c7146f18fce03e609ceb894e0343d5c94c5eba1d7d891aced6995f8d9e8a1172110d15c7c739c65fe38d832f153e206ee25b4bcc4beff0de993ef84963bf95d65d846e622b3361372bab45d213bf9164ba41bafed2e6d7fa5e7ebf9eefb209edc3d6c747a7b23edd386eafd78b277ca74aff52f51fccf1ccd0c71d20107a8f7eb0cb34f0fc5b06a32383547f34b3589dc1eb35f11a77519d4919fd99abb5e0e305bbd1c907f0497fd17504b0708d40b2c9f7e090000af4c0000504b03041400080808008d5d645200000000000000000000000011000000776f72642f73657474696e67732e786d6ca5985b73da3a1080dff32b18bf27c2d00261423a99667a9b76a633b47d17b2823558974a02c3f9f5676d63cb36a495d53c10c0bb9f77577b330fef8e3c1b1da8364c8a5514df8da3111544264c6c57d1cf1f1f6e17d1c8582c129c494157d1899ae8dde3cd43be34d45a9032232008b3cc57516aad5a2264484a393677525101d75ea4e6d8c247bd45b9d489d292506340956768321ecf10c74c4435267e7b01e28c6869e48bbd239223f9f2c2082d51a01e4fca773c738037c300e31e40fb3852319e25d9732a6ce586a619b610469332656a1af6a1251ae7afc403fbba7366541eb5093cd41fb898365155017e744ffbb9bae8886107f52a90131f1339d6bbbdba05bc82c3dab08cd953696d8d31990fa6baf4956d34d6a72b595c94ca00dfcec17249e8e54b2fdc24c5da3680c42b8faf217a7125c333703c470b34e91a946cbd12b16750c2f056635e43140b090c68d9bda635e418141aa334c5894929ed07283197c5f1b7002dfa9e1d56d15e8be559ffb6d12f327579708921ff2457dde7fcaf7117b43d94e891d056131d7ba81429db9c8cdf5d94cca956920997a84a5d1ec7d5f055192a61587dc75bfa5d4bd76565726c18c55126f0521ee211aa3c6d8991eb62448a8495bddb89febe2efa7b4f4d4f125f97c4c280b32d39f6dacdb982d92a6c4bb4552c1dd935f42ffba42d7ac6167f6214da0f494fb5de26b4d56fd8266312f2513918871ebbfbcbc980c4e5c081d61334b4ae371fcf75a045ea351e6242096b7bca9a321266ba6840799edfe5d3329cf1fdfd027d832c2b5fbe7d6dc9df5f9387784fd167b17392389e129e0c36725a06bdc81e0eeb59e3ed7130e84de52d3dbaa0cf4221ad6e1fcfe278306686e2b8df1a493c9f0e06cd1184b96312e6d3e1419e232e139a4d9bf862112f065316d00b182f9743c709b2a745ea5bc630b17e3cd784ab93832a7e226de36cca7debcec2355ace48a89ace0aa43cebeeb5f56e9d62451ded72f00fa2bdc7e2808dc36dff0df751cbbd72d3726686ed7bf1dbf3be87cc89bbc20310619e495193eacd118166c3a1d67325c9e9861e2d15c5e39f41169b9dc2829acae53876c0105cfb539f580cbd9005b5bdb7d7ac2c6429cc24d9d1a49b1645d70a995cbd8685838656bb7860630d32a4b7e94223c79e7573d9ca1126cea19081d07d8c0d9e066d4c35562621a0c9e529cdccc1b30d7450eb5f1fbbbe25747890e708b4a4865c3e5067d1221d4e5aa0f4a4a8cea08b139949dd7ac00efa29e5ca033627cbcf5b01d66e326804d1e3cd08fe1ef265558dd5c7ce57ebeab7a151be8431072ac5d2ae59427f148472adfa20855db3ffe89348beec61a10643cef3315fee35f337bc50386078f6882374360c39cb8af7f50f558f37ff03504b0708a6d298bde8030000ee120000504b03041400080808008d5d645200000000000000000000000011000000646f6350726f70732f636f72652e786d6c6dccbb0e82401085e19ea720d3c380853144a4b3b6d00798ec8e40642fd9198dbebd480c369627e7cfb7ef9e6eca1f9c640cbe85baac20676f821d7ddfc2e57c2c76908b92b73405cf2dbc58a03b647b131b13129f52889c7464c967c84b63620b836a6c10c50cec48cab9f0f3790dc991ce33f518c9dca867dc54d5161d2b5952c20f58c455842f698d7272b2baf19ea645b10697077fe5df882776ec55b02e6b043c646f504b0708d8e67048a5000000f6000000504b03041400080808008d5d645200000000000000000000000010000000646f6350726f70732f6170702e786d6c9dcd310f82301005e0dd5fd17487a2833184c2629c1dd0bd690f6842ef9ab612f8f7d6c4c8eef62eeff2bda65bddcc1608d1124a7e2c2bce0035198ba3e48ffe565c388b49a151332148be41e45d7b687c200f215988f5fd1759c630d64b927c4ac9d742443d8153b1cc1f98cb818253299f6114340c56c395f4cb012671aaaab330a43f5a7cf69bcf435f6fdffad78535011a30c54e71d11ede504b0708d005600e9a000000fe000000504b010214001400080808008d5d645216e55e4223010000650300001300000000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b010214001400080808008d5d64526ddead65ec0000005e0200000b00000000000000000000000000640100005f72656c732f2e72656c73504b010214001400080808008d5d645248ac59bb44050000391d0000110000000000000000000000000089020000776f72642f646f63756d656e742e786d6c504b010214001400080808008d5d6452cef3638ac2000000aa0100001c000000000000000000000000000c080000776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c73504b010214001400080808008d5d6452d40b2c9f7e090000af4c00000f0000000000000000000000000018090000776f72642f7374796c65732e786d6c504b010214001400080808008d5d6452a6d298bde8030000ee1200001100000000000000000000000000d3120000776f72642f73657474696e67732e786d6c504b010214001400080808008d5d6452d8e67048a5000000f60000001100000000000000000000000000fa160000646f6350726f70732f636f72652e786d6c504b010214001400080808008d5d6452d005600e9a000000fe0000001000000000000000000000000000de170000646f6350726f70732f6170702e786d6c504b05060000000008000800fc010000b61800000000
a786871c-7ab4-7d14-107c-82e0e9ac9b1c	2021-03-05 19:52:17.126	admin	1	2021-03-05 19:52:17.126	\N	\N	\N	a84cd79d-8063-4467-b5c7-710cc9ff7142	DEFAULT	40	f	f	f	f	100	\N	Report for entity "Research".docx	Template for report "Report for entity "Research"".docx	\\x504b0304140008080800889e6552000000000000000000000000130000005b436f6e74656e745f54797065735d2e786d6cb593cd4ec33010845fc5f215252e1c1042497ae0e7083d9407b0ec4d6be13f79b7a57d7b3609eda1e500aa7a4b32b3f3cd3a4933df052fb650d0a5d8cadb7a26054493ac8bab567e2c5fab07299074b4daa708addc03ca79d72cf71950f06cc456ae89f2a35268d61034d6294364a54f2568e2dbb252599b4fbd0275379bdd2b932241a48a860cd935cfd0eb8d27f1b2e3c7538f021ea5789a8c03ab953a67ef8c26d6d536da134af543a87972f4e0da65bc6183545df3ce0b1667e15f89a9ef9d019bcc26f0480d433b0bb6ca858d851c4cf162a10bbde9c0818acd0b565171747d09fbb08d4905fe041c8c17114fb6fd4ac532d700227f09c1d747256817cf7a0c7675b45cb30702115f9d1fc558e1a05eb702edfd2fef622a306a07bc1a7f93ee1b504b070816e55e422301000065030000504b0304140008080800889e65520000000000000000000000000b0000005f72656c732f2e72656c73ad92414bc4301085effd1561eedb74571091a67b11616f22f5070cc9b40db699908cbafbef8da2e0ca2a2b38b730f3defb78a4ddee97593d53ca9e838175dd80a260d9f9301a78e86f5757a0b260703873200307cab0edaaf69e6694a2c9938f591593900d4c22f15aeb6c275a30d71c2994cdc0694129cf34ea88f61147d29ba6b9d4e9ab0774952a7364ac7a4c238981174e4e3bb64f0b05a98b27a8fe10e99c441e066fe9e6437b22f8db05a89d3390766e0dfa37a4427397b8c82d27fa1bd2cf25e885041d0abebbae6209a024be74fe49b539930a63fcef9e682f141cb95358176f58ad3efa155df50a504b07086ddead65ec0000005e020000504b0304140008080800889e655200000000000000000000000011000000776f72642f646f63756d656e742e786d6ced5a4d73db3610bdfb57a04c0fed41a268d932adb19c7163c74d1a371ecb6d72eb80202ca22609068044a99dfef72e3fc46f26243b93e94c94832c128b87b70f8bdd8526172fb79e8b365448c6fd85668c271aa23ee136f3570bedb7c7d72353435261dfc62ef7e942db51a9bdbc3cba08e736276b8ffa0a01822fe761b0d01ca582b9ae4be2500fcb310fa80f834f5c7858c1a358e9b6c021407bae7e3c99ccf4900b3b109c5029e1ed7532a8a588a20b207f7a62845ea75c1254415dacc01fe9b040eed1f0007a1e66be96f9679cd4203c460497fc498d09f7522eb15330df987cdebdb00ba13242132f6fa84a30e8645c86f9e6b939c0693f80e30a8047baf8e161f1bc0e468017c00e5bcc656a177b93ed725747d29d4e7c29ea29dd2e4492a177cc1258ec1a82253a2a3de4488f422e4727352ad14a1c2c540660773a3e4d10953825fd259d9ce9a67e5c2664af3a456a8590cdf04a606f0f12b021c2c02cb516740fb21d248d0c04c5b67428ad0a64cb7aeafb924066d5b3cd425b0b7f9ece1f65f3a3589f6ff2c0e09fb34bd649ff64eec2ec0e93e896d0c2719e749812856cb633dd5609784845c0999f076a10d4b7a351be24423914ab7bbca2f782e7c99ddbdb0c23da4a1b3ee24ddc429e700a66a4d98c70df6671c9c84d3f359b7e5a5359b1c4cd96d897e06cc18eb52dee05505b7d55302d1c9692ed1232a0ba124abfc60affcc28a41fe2ecf6f3aca1b5c06296cb38c46390837950719ebfb0336051cfa0907a0665e1e6e4d3b1ae14902a8987c8a1084bb573b363e4cba999018561380ea7b19cc6f9b9a9df4194c51f77ef0af6e74df6a0f7547fe33fe796d89812cfee4d721a8b1e458f07ed59e6edb637d049e22ddde6a2cf868214b2bd31338cde3033dd30aaa9911867d3de40673ac85ca284bd697f91cf748fdbd49d66fa62df307ba398900b9817f7a439ce203e05a42a338689ea869727e164e7e0145f912239e5785dcf9d82311ad7483835e57eb9e3b96b6b97970e0e688e562ffcbdd05e617f83650eb7fa6f70b782af83bc5ace64bf7ecf384dfb3d5deebcfce00110611d83628fb4ef1c759899e150d5b12509a945b78afad1f54fea0acbe700fb54262e1b460e3804aef854458c8ade9006b5d8f9efb1dc214da1cbc933b5cb611165ad2195ab92b0f0a0a2553c3cd0b10e2252e9742191e38ee7a69eca754c7287861484a24378783528c22465e57808d0717d976672d3310d94a096bfdf967db3697f91cf7498c505c4f286e68c4ca73f92a93bbb800a17b238e12e17851f2c06ddc9eb3f585c1e21f87711ce2d6eef2e2fbe1b8dd01d74b34f8cdac8da219b93edc99fc81c1be319fae12ac0b0167201d897d4fe11ad2328f470f3fae6e1e6d75737e8edd5c79f10f3d11534b5ea3d9cd3b7d7bfa0b77883913136c7933f8e67a788fbe80e13f47e893ea2d128593fe510e44fe91b517e93be5597177af459b6d64be6d163504257965bc38777f72d6b586edc23a270bec170fd79c4964b6f052462bdcdfe03d8860b6da2c15f05fbb6d0f05af176fb779c3fefe127275793aa65ec649d603239a2d208bc828157dc4db818e6e4b485c0ffd62e75bbee60e478cb6691faeb6ca869834b061f0a5cb2adb3b7b8c9818c602b6c3d8e2ba39fa1b3a774f9e285058dffe2814a1add0225baa6920816449d5c43ec57d9b551d31bb925fe7c1bc22e15943fa498470f32b68c7694511d146c5bb08b826fae0ff2b58c7691ef9129f7eb0460fcaea1047f2395e8fbbfedbcf4fc7388d996d16e52caa8fa3c42f13908d9b6606721d541c4d605bb89c8ec83826d0b7653504555e8eb88582d43e92da974c39594a886db62b05afe95aa679c4fce22f91cf83e33a7e7d177c26d90f2bc760d8b26de611189cd03b03f39896fb682ad1c953f5a5c29eee5cf2e7dda8fea65b64576d173fc8bc351f46dffdf4d2e8ffe05504b0708c08c6cd17c050000b4220000504b0304140008080800889e65520000000000000000000000001c000000776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c73ad90cb0ac2301045f7fd8a307b9bea42449a7623825ba91f10d2e903db246446b17f6f4411051117ce6e18e6dcc3cdcbcb38883306ea9d55304f3310688dab7bdb2a3854dbd90a04b1b6b51e9c45051312944592ef71d01c7fa8eb3d8908b1a4a063f66b29c974386a4a9d471b2f8d0ba3e6b886567a6d8eba45b9c8b2a50caf0c281211e70d2c2a1d5a6405c4d380944618886af2f84b946b9adee0c699d388963f24ca3b15c4ae561076f51ce45707648eadfcdfe2c17d7a2c6e1eb97c6bb848ae504b0708cef3638ac2000000aa010000504b0304140008080800889e65520000000000000000000000000f000000776f72642f7374796c65732e786d6ced5b5b57e338127e9f5f919377dab11d72e174660e97a6e973ba67d90d3dfbacd8026bf1ad2585c0fcfa29f96e594e6493a4871d7880442a95aa4a5fdd64f3f1b7e7c01f3c61ca48142e86e687d1708043277249f8b0187ebfbb3e990d078ca3d0457e14e2c5f005b3e16fbffef27173c6f88b8fd900d687ec6c132f861ee7f1996130c7c301621fa2188730791fd10071f84a1f0c97a20d300e7cc31a8d26c626a26e4c23073306a357e9e430e348751846f7f7c4c15791b30e70c853ae14fb888336cc2331cbb9a11ee2058884c3423f73dc60111087462cbae71f9c28c864499482f5e668bb7a1b1d81ea1c5472057dad04935e214b3fdd02bf6470da8d812531081c1d3d02441fd7f109f08be18457c427fc25d1a638655d45b2934e75a9da93f93a82a4535fc98a22faa2008b70940ee6c85ca13487963524b43a1ea2bc60e06ab98f8a858453a7bb4947536366587581dc072da44a02b9043d5014e44c62d2c730b08aaf29ce993cf7320d8b29462ef330960de4b266e8db65a099acd9d362b8a6e159b6fea4582fb07ef6540223da4697ee93fd29d485d51a8bf0b3832bee3cd25822205b9c8cde2e71b4c1348e485802358e9bc7a1345f8ad00852d52d7ac0b7342a837be43e173cc451baf02b39c46788135e85cc51933951e892246594a43fd4a43fd6984994484d894206ca56e848dbe6410c9935e415d28ab3d468971001f939e5c615e2e88660083f8ef792af5bf5cd052bb2f24904788c4b6601649cc71d270314cd080aa1a7571456071fcdbc52e124051e87f5e5b014f54dce2664f6ac60b4d96c3e6cecc49ce67c3e33be01ca925fdfbe56e8e72a7ab0b76d7c091f4b4a64da4ee07616d24e8c2ed01340715668fbdc99d138d5163f97469ff4655289f6e6c4343bb39918a6298746c79cda9d194d0d30734d2414d8dd8d3c3582c8c5be5dd81785e6ac339719c40212243569c9a7973c154eb26404395c8f5f1984d393032f3e77aac2712fd0f53b0e7338c991e035f57a59d3efdacae5a587625c726b26fe4edc2e51f88458c9eee175ec3ed3681d97d972c2bad57be66956ef19ec25281d0f183944131439a7bc72346065c10773cd92648357f899e350347fcce0883dc628c42c55d9344b867dd855bfc91c45d2eb53a0562bff9c97dfa728f423e711bb755888a8d5277349010bf54a5a55e7818ab5972052a50b811c69fa4d33941bc82915ea9310aa0aa1fed9a0ca264d2b561f4656f39426ec49330cd4582dfff85cd7cdc5dd8d3c3560554401cb4fb89468e675e73433bc9718531fa2b813f911ad5c58f4eac99b1716bffe32809f8f9b333772aef03d5afb9ca563d938bda5d978395c4ed5c7f2f1eb080adec1e60c3187903b914516c3808411bd3987803184194f7c50ce60c4f839234839e9305e19be202e191a4a11d89f40fd84a06db1ac56924bb693c847e1434e84c393efcbaa8895a115111d00a227cb7399d34743b25436d0b02a6c17b71b3b6e31368b91431221d13dc7d06e410414120166c04ed674927ff9cfda8701b4e6914ac258965016458c3530925808b2405a4e0b73baf8fe6b127d971c2616c37be4333c4c27be7fb9a524a210dd17c3f93c1b5ce280dc10d7c5e162c8e9baa00d3de2e2ff7a38fcceb05b9bfaf77512f92bbc9d681dc2776b321dd6cce933f713b4beb1a87f800cca3290e877b1da17cbd6a49427b119abc852305f4b9214133f723912d98cdd3b7b18899bd781296f3e3fe2e69672f3deececfdb21bef87dd1de13e965999c738e3cc3f06b788a2a4e71e8860d8104587d572bde24a3dcc23e8f129883dc4089337b78e61c43bb4f2f1e03315556f7dfbd3aeae6294d1ab1aa98af0953ce780d51cf2ec6218e7a796ec22a6beb8d588e1a6a79b69525344489e678a6c415dd3cc0af541ca889baf1a8dc6e7b6359d56654e64e824ec4dea4966bb746518aacbb24260b77f855b9508a1e8df4a204a959c2017e5124a4e89ac3cd39c78dedd5cb3b1797925af6be449187bc438fe1d2497f35e3af39588aea8315526d615865e030c3e9e8d1aa9737316adb948af5f9ffc42b29a488de4aa289c5a8b26f4bfb6a2a93623174d62f2533656af9bc48caa6e12e7af18ba541826a944735dedc9e9f53c0948c90e97620eaa0cc701572b87a1df7761f78b6bc5b695526da69cae946933d9b285255fe52cd66e67b18ee42c562f67a9c7bebfbd23891255c791cc7f90238daf67e6c5559b236d759bc92eb7991cc66decdd6e631fc96dec77b729ddc67a779ba6dbec0ff6e3ddb01f1f09f6e377d897b0b7ffbf614f14433fc93dc41d327238a635f7c85adfa2f3cd1b5fcda6a9a573de056eb98b297b430dd0f78f03a0fbd6288065b7d40901b28763aae7df5d1cbca72f73b462f5c172226727409562228e18606fd2ec979a8b2879f078b1666e4f9ace6ec8dbd79cbb1f582be6158eba663c0a92ab815d304d170e1407239db0d21d769d77f7b3de769efd4d53b4eddd8d935c2d1cc63ec9bd46d76ca701f8b79d18de643fbe157ad62ba0671d0c7af215c03bf4de4207bb1568f62b80661f0c6872d3fc0eb49f57d4d61aad7e40191f0c28729bf90e94bf5397b4ed61d297101a14beeb09d22023ebde49fc9c26818462958fefa1d99b5aed8f41fa59ae781eda6ab582e2c0b72ff93e5add992997acfbbc6209d741cb7b21c46fb947cf0f40b1543ac25923ebbe8d1b95c3c6806c71794f959af8747b8533564e572a9cf19e13570da3dd1257be74ff79abc541359ce6cd26ae7f1818d5a1fb6e7bdcbe3b46d0bed38fd8a30346ecf8c25507ec55c4c141738ee21d4d3f7bb92d39fced9010c6fe132276f201c020de565005fde6ee35f464af10daca1b77075c090cbe46fe325df0269343cdcfcca93d396d18556869e9dd95d4fd4ee5768f9816206eb950299637de4295fcf2b4f164ef9549e2ae6786b83b4c7a50c5010df77cb3b9e11d8b152c166f1cb6a2aea0782de69a98b27a84fc2bd39c4faf3480b6b304d8c73d45fe7f025bee230a92fddbaf5b77a9b051cd1546f0737d2dbb82a7923fdf4eca9b7d8dcbc59ba7f5102946925751dba361f9baea56cb26749aedfaa94e2dd148dcd537ffc7c517f59bffaa94cd57beead9df4adc5700b34db6436a2bf719294e02882f22ea62daf2b8308a5b4b9c51f2a38a80458133ae14386d0f1745f37ae83d76146b7bda2579367ae84d08643417df1c679b3f0eb64df294b8057b292c2fb1ef7f43eae23b85e54e7cd711b611b5c84c67410117dd1df293d7d82253bca15d36fecac8d7f3ddf741b2b87bdae8f4f64636a74cd5fb8964ef90e9deeb5fa2e49f39da11e2640407e8f79b08b34f0f85b07a31383547f34bb988dc9eb35f91a75515d4919fd99abb5e0e30b55e0e283e42c8fe0b504b0708705e9f0f7f090000af4c0000504b0304140008080800889e655200000000000000000000000011000000776f72642f73657474696e67732e786d6ca598dd8fda3810c0dff7af4079df358116b268d96a75abf67a6aa54af4eedd385e62117fd43604eeafbf49027112d2d6f1ed030b64e6c7cc78be92a70f279e4f8e541b26c53a8a1fa6d1840a22532676ebe8efef1fef9368622c1629cea5a0ebe84c4df4e1f9eea958196a2d489909108459156a1d65d6aa154286649463f320151570f14d6a8e2d7cd43b946a5c8012cfd16c3a5da042ea546949a831f0ed6b7d31ba10b50f50bebd31425f2539702a6c4dd534c716fc311953e64ac301e671cc44d4f817bfbb417046b434f2cd3e10c92fb6544e817e3cfdb57b858f415dc2905d3c344a70316b6c09f38de70ef07e1c60d60370e2e307c77a7f50f7c05370c25b96337baebc694ed9d791cb49d7beb4e369721f43ea4b5fd856637d1e4896b2544684e3520a2e1c5ed1e8652bc9b0b60d20f52a9f21442f4fc9f8904e972841b3ae41e9ce2b537b06a50cef34e65788622181012d7bd0f40a390585c6284d716a324afb014acd6debfb5d8092be67c77574d06275d1bf6ff4cb5c5f1d5d62c85fc9d5bf73f9d7b80bda1e4af44468ab9ca71e2a65ca3627e3f72b4a16542bc9844b54a56e8f63307c75864a1856dff08e7ed3d23577999e1a46799429bc548778823e91b5c4c8b018912265d5c870a23f86457f1ca8e949e261492c0c38db92633ffb71ae60b60adb126d154b4776031dd0be688b5eb1c57f320aed8764e7abde3674166cd9366712f25139188789b3ffcdc980c46d0785d613d485879b8fe75c69917a8d879850c2c69ef3a68c8499270da8288a87625e85337e7c4cd057c8b2eae5eb9796fce3903cc47b8e3e8bbd93c4f19cf074b491f32ae865f67058cf1a6f4fa341ef6a6fe9c9057d110a6975fb7811c7a3310b14c7fdd648e2e57c34688920cc1d93309f8f0ff2127199d27cdec4178b38194d49a017305eeda48e13644f8bd4b78c6162fd78ae09d7270755fc42dac6d98cfbd69d856bb49a915035dd7dd9b3ee7eb62e6f32aca8a3dd0efe51b43fb03862e370bbff87fba4e541b969b930e3f6bdf8fd65df43e6cc5de1018830cfa4b892ae9b2302cd8643ade74a52d02d3d592acadb3f832c367b850535b5cb71ec8021b8f6a73eb11c7a210b6a7bf3bfb2f290a53097644fd36e5a945d2b6472f51a160e1a5aede2818d35c890dea60b8d1c7bd6cd6d2b47983887420642db211c3e0dda987aaccc4240b3db535a98a3671be8a036ff7ceafa96d2f1415e22d0921a72f9489d4549369e94a0ecaca8cea18b13994bdd7a6011744f3ef0c08293d5e79d006bb7393482e8f96e027f4fc5aaaec6fa63e7ab4dfd6c6852ac60cc814ab9b46b96d2ef25a15aab3e4a6137ec5ffa22d2bf0eb050832197f958ac0e9af91b5e2a1c31dc7bc411ba18869c65e5fbeb83aae7bbff00504b07085ec44c21ec030000ee120000504b0304140008080800889e655200000000000000000000000011000000646f6350726f70732f636f72652e786d6c6dccbb0e82401085e19ea720d3c380853144a4b3b6d00798ec8e40642fd9198dbebd480c369627e7cfb7ef9e6eca1f9c640cbe85baac20676f821d7ddfc2e57c2c76908b92b73405cf2dbc58a03b647b131b13129f52889c7464c967c84b63620b836a6c10c50cec48cab9f0f3790dc991ce33f518c9dca867dc54d5161d2b5952c20f58c455842f698d7272b2baf19ea645b10697077fe5df882776ec55b02e6b043c646f504b0708d8e67048a5000000f6000000504b0304140008080800889e655200000000000000000000000010000000646f6350726f70732f6170702e786d6c9dcd310f82301005e0dd5fd17487a2833184c2629c1dd0bd690f6842ef9ab612f8f7d6c4c8eef62eeff2bda65bddcc1608d1124a7e2c2bce0035198ba3e48ffe565c388b49a151332148be41e45d7b687c200f215988f5fd1759c630d64b927c4ac9d742443d8153b1cc1f98cb818253299f6114340c56c395f4cb012671aaaab330a43f5a7cf69bcf435f6fdffad78535011a30c54e71d11ede504b0708d005600e9a000000fe000000504b01021400140008080800889e655216e55e4223010000650300001300000000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b01021400140008080800889e65526ddead65ec0000005e0200000b00000000000000000000000000640100005f72656c732f2e72656c73504b01021400140008080800889e6552c08c6cd17c050000b4220000110000000000000000000000000089020000776f72642f646f63756d656e742e786d6c504b01021400140008080800889e6552cef3638ac2000000aa0100001c0000000000000000000000000044080000776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c73504b01021400140008080800889e6552705e9f0f7f090000af4c00000f0000000000000000000000000050090000776f72642f7374796c65732e786d6c504b01021400140008080800889e65525ec44c21ec030000ee12000011000000000000000000000000000c130000776f72642f73657474696e67732e786d6c504b01021400140008080800889e6552d8e67048a5000000f6000000110000000000000000000000000037170000646f6350726f70732f636f72652e786d6c504b01021400140008080800889e6552d005600e9a000000fe00000010000000000000000000000000001b180000646f6350726f70732f6170702e786d6c504b05060000000008000800fc010000f31800000000
b5f9d089-2a2b-dff6-4f56-9755d3bfcadb	2021-03-05 19:54:54.808	admin	1	2021-03-05 19:54:54.808	\N	\N	\N	abe22d13-565a-e0a1-e8bb-ee60deba29a6	DEFAULT	40	f	f	f	f	100	\N	Report for entity "Research".docx	Template for report "Report for entity "Research"".docx	\\x504b0304140008080800db9e6552000000000000000000000000130000005b436f6e74656e745f54797065735d2e786d6cb593cd4ec33010845fc5f215252e1c1042497ae0e7083d9407b0ec4d6be13f79b7a57d7b3609eda1e500aa7a4b32b3f3cd3a4933df052fb650d0a5d8cadb7a26054493ac8bab567e2c5fab07299074b4daa708addc03ca79d72cf71950f06cc456ae89f2a35268d61034d6294364a54f2568e2dbb252599b4fbd0275379bdd2b932241a48a860cd935cfd0eb8d27f1b2e3c7538f021ea5789a8c03ab953a67ef8c26d6d536da134af543a87972f4e0da65bc6183545df3ce0b1667e15f89a9ef9d019bcc26f0480d433b0bb6ca858d851c4cf162a10bbde9c0818acd0b565171747d09fbb08d4905fe041c8c17114fb6fd4ac532d700227f09c1d747256817cf7a0c7675b45cb30702115f9d1fc558e1a05eb702edfd2fef622a306a07bc1a7f93ee1b504b070816e55e422301000065030000504b0304140008080800db9e65520000000000000000000000000b0000005f72656c732f2e72656c73ad92414bc4301085effd1561eedb74571091a67b11616f22f5070cc9b40db699908cbafbef8da2e0ca2a2b38b730f3defb78a4ddee97593d53ca9e838175dd80a260d9f9301a78e86f5757a0b260703873200307cab0edaaf69e6694a2c9938f591593900d4c22f15aeb6c275a30d71c2994cdc0694129cf34ea88f61147d29ba6b9d4e9ab0774952a7364ac7a4c238981174e4e3bb64f0b05a98b27a8fe10e99c441e066fe9e6437b22f8db05a89d3390766e0dfa37a4427397b8c82d27fa1bd2cf25e885041d0abebbae6209a024be74fe49b539930a63fcef9e682f141cb95358176f58ad3efa155df50a504b07086ddead65ec0000005e020000504b0304140008080800db9e655200000000000000000000000011000000776f72642f646f63756d656e742e786d6ced5c5b57db38107eefaff0a67dd87d208e93100287d0c302bd2db41c60b77ddba3c822f1625baea4c4c9f6ec7fdf91edf8169bda86d2a4150f8035a36f469f46a39130397cb9706c6d4e18b7a83b6a19ed4e4b232ea6a6e54e46ad3f6f5eed0c5b1a17c835914d5d326a2d096fbd3c7a76e81f9814cf1ce20a0d105c7ee07ba3d65408ef40d7399e1207f136f5880bc25bca1c24e0914d7493211fa01d5bef763a03dda7ccf418c58473683d0d85ad08915501a4b7b71626a7912f212a233612301e3eb53cbe42430ddc7390e5b6e2f119fd3508c7c28c727a2bda983a912fc1a0a0bfd1b97f787e1587b208457e394d5902e134f6a5d9d81c3b01d8ad07d0cd0138b8ca381cc4ee66de0ee07930c363cbb6c432184d3ccb550712cd743896349fdcaee248283ab7c60cb16541b0c8a552838e6829247454622317ad788a988801cc4acba7082217a7b83ea59d3d7da877b30e99934a919a73c8b4d084216705e2594d88815e62c6c80a64d1881aee31824c3e25244f90c9d753dfd7081ae647361fb566cc3d88faefc4fd65ac1fcc93c0a0f7e98576a21ff170a177854e6481496a39772a7491211bcf4c352b1ef509f3a8e52681ea79ebd351485f18a11436ab4b3421978c26c99d9a8b18434ea509df82495c409e98a6d470b11aa6ae69055b46a2fab958f5f38cf09c262ad6442e87c1a6f4ac32e38e077bab2b52aaa9c592d1bd860c288e99d04f91406f2c02e9074f97ab7ee3a67bc1d81adb168578f4123007769cbbafcc0c68ac6750483d8db27071f2a9b8afa490728907f3a608d76269c7cbc8e5bd610ce4fb7edbef05741afbfb43fd02a22cf876719ed2df2fd207be7bfa5bf72ed144460f3b666d277b01e9327a1c28cfe2d12e6a03f5c3d1924542faa029482adb1b03c3a80d33d00d239f1ab1b1d7ab0db4a703cd199790d3ab4ff29eee5093d8bd985fe41ac3da2843c8059613d4a4094e237f524879cf2c844535bc2409873307abf818a79d1353a7eaba132023c11e09ab265b2f575c7765e5f2f5147924415bdff86ba19d20778e7802377918dc6b46675eb25b0e78bd7acfd88dea3d9d2f9d64e10110b62a06c50a695539ead033c621a26249e293315908e2cae31fd705e2771e72090f876c18096013b8f4531e516e7a4d0ad474e5bfc2b29b148536c577c4cc8685cc5a4d76ae5cc2428d36adf4e2818ab59123b94a171239aab86ed653b98e7032a0261b427a40a8f96e908609b7956e13a0eefa2c0df8bc621ac8405dfff53a3b3693d427794f875e94412ccf49e2d1705a1f69a84f971e613664714c6dca5217168dcee4eb171647cf34f83af40fc6d45c1e1dfeb2b3a35d40357b6b11531b2f3593e245ff1f6dd836da03edd7630f812dcd06609713f3376d26a1b4abb357675767ef4fceb477c79f7ed72c573b86a2567c8075faeef40fed1d9a23cd680fdb9dbfbb835d8dbada05c2da876bed93b6b313da8f7cf092a7a885655ba25671f4f6f4407bf1e58a70228b64a36d99ff1dea529005d03308f2d16b68f09470cc2c4feea459cb6622f8c62e5c0b58b99ab01c92f580cbf61b68fef6f6c5ba69f1adcdde58c2ce9915b2e91b9b6d822ec6f61a3eb45d96d818dbc12944f30fe6080ed837686c93d70cb67abd4cff23e8faa356a7053f056486510bcd042dd73fa7f46e05dfe91f77f29ac120d71d0c3b4b570a81272038a176e8cb60bf5f625fa9fd406a51a4acc7848c9592f8c6ebcdb1a8684d64143e26aec4c16e2e5091fbb17fa5a8eb2b3f27bdc79b954747cf9f8fe1303e3a733c9b2e09e15ded1212af852d28aba10e7d8f1c529034f24e9679a817ba180eeba7a03743e625e5c19d9d22b4585a9bd037d4211a324d06e55ffb84ce5cc1968adc62e9c3c87d6511dbd40c456eb1f431c8ed2a728ba58f416e4f915b2c7d0c72fb8adc62e96390bbabc82d963e8cdc7304e7ed99a98adb12e903d9a5ee44d17b8fbd87d17b437d75882891d666f61c8de5b536654b3842a8882db3f7105e83dbce272136682bb8f8fb392e735e7c7151f18d79de1115c2c51e01855e744ba3682c9156a3710a1bd671b45fe1f06a46315a22adcfe8ad3c1b188ad012694342bb8ad0126943427b8ad012694342fb8ad0126943427715a125d2fa84dad19d8aa2b444da80d2d5458ae2b4445a9f53417d55dc97d9ab46a79d9ced3155c1596aaf369ba52f81e59d7afcab92e039fdaed7fae88a47148ca2c0e59c9b39d70efd9ff2cd32a33bdcaff2b6d28fac17d1f8e4af5d05be6cc8aa8fdebbba229cce182657e4f3cc6244fe831bef69e9a7f6b1236f4fb62ec36e12d9193e4fa8cb675bf856dbc6127a213f6c41ee5e8ad212696d4a2f199d5b263115a325d2da8cae126db4fc65eda0c82d913627772b5f17de7c5a6fc0b31ff5cfa79bc4fe8b2f2828b6b6ef3cbb592ce2b0c452349619ac46a3b32aac149165062bfe493f2aa7148f6506abf1c8561b128e8b28456999c19a946ee79b3b1b4aa67447dda216daf8216e51bbdddd4195dbc7a7d0fb5eb799812f1bb2f4a2dbccebd9f81f8245fa10d3d7a2468da58f365163fb644ae4a79a6c5ddedb24f2ef27587ec286a2b744fa607ab7f2c263e3d97dda1be5ef70e9b14933f0e20b8f821987c978fbaad00da553a65e456699c17a646ee7f168b3b87ce2fba42a47230e735b7010f026d7ff46074c63bfb327299cc2ef83612f386dca778e46adf5f70a64c70bc424e1d403fd7e3f38b4306b3215c9e3980a419de4d926b72ba99ef536ed9d7c0e3e4eec99fc6df559f247cffe07504b0708cfa67b10c7070000915e0000504b0304140008080800db9e65520000000000000000000000001c000000776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c73ad90cb0ac2301045f7fd8a307b9bea42449a7623825ba91f10d2e903db246446b17f6f4411051117ce6e18e6dcc3cdcbcb38883306ea9d55304f3310688dab7bdb2a3854dbd90a04b1b6b51e9c45051312944592ef71d01c7fa8eb3d8908b1a4a063f66b29c974386a4a9d471b2f8d0ba3e6b886567a6d8eba45b9c8b2a50caf0c281211e70d2c2a1d5a6405c4d380944618886af2f84b946b9adee0c699d388963f24ca3b15c4ae561076f51ce45707648eadfcdfe2c17d7a2c6e1eb97c6bb848ae504b0708cef3638ac2000000aa010000504b0304140008080800db9e65520000000000000000000000000f000000776f72642f7374796c65732e786d6ced5b5b57e338127e9f5f919377dab11d72e174660e97a6e973ba67d90d3dfbacd8026bf1ad2585c0fcfa29f96e594e6493a4871d7880442a95aa4a5fdd64f3f1b7e7c01f3c61ca48142e86e687d1708043277249f8b0187ebfbb3e990d078ca3d0457e14e2c5f005b3e16fbffef27173c6f88b8fd900d687ec6c132f861ee7f1996130c7c301621fa2188730791fd10071f84a1f0c97a20d300e7cc31a8d26c626a26e4c23073306a357e9e430e348751846f7f7c4c15791b30e70c853ae14fb888336cc2331cbb9a11ee2058884c3423f73dc60111087462cbae71f9c28c864499482f5e668bb7a1b1d81ea1c5472057dad04935e214b3fdd02bf6470da8d812531081c1d3d02441fd7f109f08be18457c427fc25d1a638655d45b2934e75a9da93f93a82a4535fc98a22faa2008b70940ee6c85ca13487963524b43a1ea2bc60e06ab98f8a858453a7bb4947536366587581dc072da44a02b9043d5014e44c62d2c730b08aaf29ce993cf7320d8b29462ef330960de4b266e8db65a099acd9d362b8a6e159b6fea4582fb07ef6540223da4697ee93fd29d485d51a8bf0b3832bee3cd25822205b9c8cde2e71b4c1348e485802358e9bc7a1345f8ad00852d52d7ac0b7342a837be43e173cc451baf02b39c46788135e85cc51933951e892246594a43fd4a43fd6984994484d894206ca56e848dbe6410c9935e415d28ab3d468971001f939e5c615e2e88660083f8ef792af5bf5cd052bb2f24904788c4b6601649cc71d270314cd080aa1a7571456071fcdbc52e124051e87f5e5b014f54dce2664f6ac60b4d96c3e6cecc49ce67c3e33be01ca925fdfbe56e8e72a7ab0b76d7c091f4b4a64da4ee07616d24e8c2ed01340715668fbdc99d138d5163f97469ff4655289f6e6c4343bb39918a6298746c79cda9d194d0d30734d2414d8dd8d3c3582c8c5be5dd81785e6ac339719c40212243569c9a7973c154eb26404395c8f5f1984d393032f3e77aac2712fd0f53b0e7338c991e035f57a59d3efdacae5a587625c726b26fe4edc2e51f88458c9eee175ec3ed3681d97d972c2bad57be66956ef19ec25281d0f183944131439a7bc72346065c10773cd92648357f899e350347fcce0883dc628c42c55d9344b867dd855bfc91c45d2eb53a0562bff9c97dfa728f423e711bb755888a8d5277349010bf54a5a55e7818ab5972052a50b811c69fa4d33941bc82915ea9310aa0aa1fed9a0ca264d2b561f4656f39426ec49330cd4582dfff85cd7cdc5dd8d3c3560554401cb4fb89468e675e73433bc9718531fa2b813f911ad5c58f4eac99b1716bffe32809f8f9b333772aef03d5afb9ca563d938bda5d978395c4ed5c7f2f1eb080adec1e60c3187903b914516c3808411bd3987803184194f7c50ce60c4f839234839e9305e19be202e191a4a11d89f40fd84a06db1ac56924bb693c847e1434e84c393efcbaa8895a115111d00a227cb7399d34743b25436d0b02a6c17b71b3b6e31368b91431221d13dc7d06e410414120166c04ed674927ff9cfda8701b4e6914ac258965016458c3530925808b2405a4e0b73baf8fe6b127d971c2616c37be4333c4c27be7fb9a524a210dd17c3f93c1b5ce280dc10d7c5e162c8e9baa00d3de2e2ff7a38fcceb05b9bfaf77512f92bbc9d681dc2776b321dd6cce933f713b4beb1a87f800cca3290e877b1da17cbd6a49427b119abc852305f4b9214133f723912d98cdd3b7b18899bd781296f3e3fe2e69672f3deececfdb21bef87dd1de13e965999c738e3cc3f06b788a2a4e71e8860d8104587d572bde24a3dcc23e8f129883dc4089337b78e61c43bb4f2f1e03315556f7dfbd3aeae6294d1ab1aa98af0953ce780d51cf2ec6218e7a796ec22a6beb8d588e1a6a79b69525344489e678a6c415dd3cc0af541ca889baf1a8dc6e7b6359d56654e64e824ec4dea4966bb746518aacbb24260b77f855b9508a1e8df4a204a959c2017e5124a4e89ac3cd39c78dedd5cb3b1797925af6be449187bc438fe1d2497f35e3af39588aea8315526d615865e030c3e9e8d1aa9737316adb948af5f9ffc42b29a488de4aa289c5a8b26f4bfb6a2a93623174d62f2533656af9bc48caa6e12e7af18ba541826a944735dedc9e9f53c0948c90e97620eaa0cc701572b87a1df7761f78b6bc5b695526da69cae946933d9b285255fe52cd66e67b18ee42c562f67a9c7bebfbd23891255c791cc7f90238daf67e6c5559b236d759bc92eb7991cc66decdd6e631fc96dec77b729ddc67a779ba6dbec0ff6e3ddb01f1f09f6e377d897b0b7ffbf614f14433fc93dc41d327238a635f7c85adfa2f3cd1b5fcda6a9a573de056eb98b297b430dd0f78f03a0fbd6288065b7d40901b28763aae7df5d1cbca72f73b462f5c172226727409562228e18606fd2ec979a8b2879f078b1666e4f9ace6ec8dbd79cbb1f582be6158eba663c0a92ab815d304d170e1407239db0d21d769d77f7b3de769efd4d53b4eddd8d935c2d1cc63ec9bd46d76ca701f8b79d18de643fbe157ad62ba0671d0c7af215c03bf4de4207bb1568f62b80661f0c6872d3fc0eb49f57d4d61aad7e40191f0c28729bf90e94bf5397b4ed61d297101a14beeb09d22023ebde49fc9c26818462958fefa1d99b5aed8f41fa59ae781eda6ab582e2c0b72ff93e5add992997acfbbc6209d741cb7b21c46fb947cf0f40b1543ac25923ebbe8d1b95c3c6806c71794f959af8747b8533564e572a9cf19e13570da3dd1257be74ff79abc541359ce6cd26ae7f1818d5a1fb6e7bdcbe3b46d0bed38fd8a30346ecf8c25507ec55c4c141738ee21d4d3f7bb92d39fced9010c6fe132276f201c020de565005fde6ee35f464af10daca1b77075c090cbe46fe325df0269343cdcfcca93d396d18556869e9dd95d4fd4ee5768f9816206eb950299637de4295fcf2b4f164ef9549e2ae6786b83b4c7a50c5010df77cb3b9e11d8b152c166f1cb6a2aea0782de69a98b27a84fc2bd39c4faf3480b6b304d8c73d45fe7f025bee230a92fddbaf5b77a9b051cd1546f0737d2dbb82a7923fdf4eca9b7d8dcbc59ba7f5102946925751dba361f9baea56cb26749aedfaa94e2dd148dcd537ffc7c517f59bffaa94cd57beead9df4adc5700b34db6436a2bf719294e02882f22ea62daf2b8308a5b4b9c51f2a38a80458133ae14386d0f1745f37ae83d76146b7bda2579367ae84d08643417df1c679b3f0eb64df294b8057b292c2fb1ef7f43eae23b85e54e7cd711b611b5c84c67410117dd1df293d7d82253bca15d36fecac8d7f3ddf741b2b87bdae8f4f64636a74cd5fb8964ef90e9deeb5fa2e49f39da11e2640407e8f79b08b34f0f85b07a31383547f34bb988dc9eb35f91a75515d4919fd99abb5e0e30b55e0e283e42c8fe0b504b0708705e9f0f7f090000af4c0000504b0304140008080800db9e655200000000000000000000000011000000776f72642f73657474696e67732e786d6ca598dd8fda3810c0dff7af4079df358116b268d96a75abf67a6aa54af4eedd385e62117fd43604eeafbf49027112d2d6f1ed030b64e6c7cc78be92a70f279e4f8e541b26c53a8a1fa6d1840a22532676ebe8efef1fef9368622c1629cea5a0ebe84c4df4e1f9eea958196a2d489909108459156a1d65d6aa154286649463f320151570f14d6a8e2d7cd43b946a5c8012cfd16c3a5da042ea546949a831f0ed6b7d31ba10b50f50bebd31425f2539702a6c4dd534c716fc311953e64ac301e671cc44d4f817bfbb417046b434f2cd3e10c92fb6544e817e3cfdb57b858f415dc2905d3c344a70316b6c09f38de70ef07e1c60d60370e2e307c77a7f50f7c05370c25b96337baebc694ed9d791cb49d7beb4e369721f43ea4b5fd856637d1e4896b2544684e3520a2e1c5ed1e8652bc9b0b60d20f52a9f21442f4fc9f8904e972841b3ae41e9ce2b537b06a50cef34e65788622181012d7bd0f40a390585c6284d716a324afb014acd6debfb5d8092be67c77574d06275d1bf6ff4cb5c5f1d5d62c85fc9d5bf73f9d7b80bda1e4af44468ab9ca71e2a65ca3627e3f72b4a16542bc9844b54a56e8f63307c75864a1856dff08e7ed3d23577999e1a46799429bc548778823e91b5c4c8b018912265d5c870a23f86457f1ca8e949e261492c0c38db92633ffb71ae60b60adb126d154b4776031dd0be688b5eb1c57f320aed8764e7abde3674166cd9366712f25139188789b3ffcdc980c46d0785d613d485879b8fe75c69917a8d879850c2c69ef3a68c8499270da8288a87625e85337e7c4cd057c8b2eae5eb9796fce3903cc47b8e3e8bbd93c4f19cf074b491f32ae865f67058cf1a6f4fa341ef6a6fe9c9057d110a6975fb7811c7a3310b14c7fdd648e2e57c34688920cc1d93309f8f0ff2127199d27cdec4178b38194d49a017305eeda48e13644f8bd4b78c6162fd78ae09d7270755fc42dac6d98cfbd69d856bb49a915035dd7dd9b3ee7eb62e6f32aca8a3dd0efe51b43fb03862e370bbff87fba4e541b969b930e3f6bdf8fd65df43e6cc5de1018830cfa4b892ae9b2302cd8643ade74a52d02d3d592acadb3f832c367b850535b5cb71ec8021b8f6a73eb11c7a210b6a7bf3bfb2f290a53097644fd36e5a945d2b6472f51a160e1a5aede2818d35c890dea60b8d1c7bd6cd6d2b47983887420642db211c3e0dda987aaccc4240b3db535a98a3671be8a036ff7ceafa96d2f1415e22d0921a72f9489d4549369e94a0ecaca8cea18b13994bdd7a6011744f3ef0c08293d5e79d006bb7393482e8f96e027f4fc5aaaec6fa63e7ab4dfd6c6852ac60cc814ab9b46b96d2ef25a15aab3e4a6137ec5ffa22d2bf0eb050832197f958ac0e9af91b5e2a1c31dc7bc411ba18869c65e5fbeb83aae7bbff00504b07085ec44c21ec030000ee120000504b0304140008080800db9e655200000000000000000000000011000000646f6350726f70732f636f72652e786d6c6dccbb0e82401085e19ea720d3c380853144a4b3b6d00798ec8e40642fd9198dbebd480c369627e7cfb7ef9e6eca1f9c640cbe85baac20676f821d7ddfc2e57c2c76908b92b73405cf2dbc58a03b647b131b13129f52889c7464c967c84b63620b836a6c10c50cec48cab9f0f3790dc991ce33f518c9dca867dc54d5161d2b5952c20f58c455842f698d7272b2baf19ea645b10697077fe5df882776ec55b02e6b043c646f504b0708d8e67048a5000000f6000000504b0304140008080800db9e655200000000000000000000000010000000646f6350726f70732f6170702e786d6c9dcd310f82301005e0dd5fd17487a2833184c2629c1dd0bd690f6842ef9ab612f8f7d6c4c8eef62eeff2bda65bddcc1608d1124a7e2c2bce0035198ba3e48ffe565c388b49a151332148be41e45d7b687c200f215988f5fd1759c630d64b927c4ac9d742443d8153b1cc1f98cb818253299f6114340c56c395f4cb012671aaaab330a43f5a7cf69bcf435f6fdffad78535011a30c54e71d11ede504b0708d005600e9a000000fe000000504b01021400140008080800db9e655216e55e4223010000650300001300000000000000000000000000000000005b436f6e74656e745f54797065735d2e786d6c504b01021400140008080800db9e65526ddead65ec0000005e0200000b00000000000000000000000000640100005f72656c732f2e72656c73504b01021400140008080800db9e6552cfa67b10c7070000915e0000110000000000000000000000000089020000776f72642f646f63756d656e742e786d6c504b01021400140008080800db9e6552cef3638ac2000000aa0100001c000000000000000000000000008f0a0000776f72642f5f72656c732f646f63756d656e742e786d6c2e72656c73504b01021400140008080800db9e6552705e9f0f7f090000af4c00000f000000000000000000000000009b0b0000776f72642f7374796c65732e786d6c504b01021400140008080800db9e65525ec44c21ec030000ee120000110000000000000000000000000057150000776f72642f73657474696e67732e786d6c504b01021400140008080800db9e6552d8e67048a5000000f6000000110000000000000000000000000082190000646f6350726f70732f636f72652e786d6c504b01021400140008080800db9e6552d005600e9a000000fe0000001000000000000000000000000000661a0000646f6350726f70732f6170702e786d6c504b05060000000008000800fc0100003e1b00000000
\.


--
-- TOC entry 3527 (class 0 OID 37029)
-- Dependencies: 216
-- Data for Name: sec_constraint; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_constraint (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, code, check_type, operation_type, entity_name, join_clause, where_clause, groovy_script, filter_xml, is_active, group_id) FROM stdin;
\.


--
-- TOC entry 3528 (class 0 OID 37039)
-- Dependencies: 217
-- Data for Name: sec_entity_log; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_entity_log (id, create_ts, created_by, sys_tenant_id, event_ts, user_id, change_type, entity, entity_instance_name, entity_id, string_entity_id, int_entity_id, long_entity_id, changes) FROM stdin;
\.


--
-- TOC entry 3529 (class 0 OID 37045)
-- Dependencies: 218
-- Data for Name: sec_filter; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_filter (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, component, name, code, xml, user_id, global_default, username) FROM stdin;
b61d18cb-e79a-46f3-b16d-eaf4aebb10dd	2021-03-02 16:39:03.417392	admin	0	\N	\N	\N	\N	\N	[sec$User.browse].genericFilter	Search by role	\N	<?xml version="1.0" encoding="UTF-8"?><filter><and><c name="UrMxpkfMGn" class="com.haulmont.cuba.security.entity.Role" type="CUSTOM" locCaption="Role" entityAlias="u" join="join u.userRoles ur">ur.role.id = :component$genericFilter.UrMxpkfMGn32565<param name="component$genericFilter.UrMxpkfMGn32565">NULL</param></c></and></filter>	60885987-1b61-4247-94c7-dff348347f93	f	admin
\.


--
-- TOC entry 3530 (class 0 OID 37052)
-- Dependencies: 219
-- Data for Name: sec_group; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_group (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, name, parent_id) FROM stdin;
0fa2b1a5-1d68-4d69-9fbd-dff348347f93	2021-03-02 16:39:03.408901	\N	0	\N	\N	\N	\N	\N	Company	\N
\.


--
-- TOC entry 3531 (class 0 OID 37059)
-- Dependencies: 220
-- Data for Name: sec_group_hierarchy; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_group_hierarchy (id, create_ts, created_by, sys_tenant_id, group_id, parent_id, hierarchy_level) FROM stdin;
\.


--
-- TOC entry 3532 (class 0 OID 37062)
-- Dependencies: 221
-- Data for Name: sec_localized_constraint_msg; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_localized_constraint_msg (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, entity_name, operation_type, values_) FROM stdin;
\.


--
-- TOC entry 3533 (class 0 OID 37069)
-- Dependencies: 222
-- Data for Name: sec_logged_attr; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_logged_attr (id, create_ts, created_by, entity_id, name) FROM stdin;
\.


--
-- TOC entry 3534 (class 0 OID 37072)
-- Dependencies: 223
-- Data for Name: sec_logged_entity; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_logged_entity (id, create_ts, created_by, name, auto, manual) FROM stdin;
\.


--
-- TOC entry 3535 (class 0 OID 37075)
-- Dependencies: 224
-- Data for Name: sec_permission; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_permission (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, permission_type, target, value_, role_id) FROM stdin;
\.


--
-- TOC entry 3536 (class 0 OID 37079)
-- Dependencies: 225
-- Data for Name: sec_presentation; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_presentation (id, create_ts, created_by, update_ts, updated_by, sys_tenant_id, component, name, xml, user_id, is_auto_save) FROM stdin;
\.


--
-- TOC entry 3537 (class 0 OID 37085)
-- Dependencies: 226
-- Data for Name: sec_remember_me; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_remember_me (id, create_ts, created_by, version, user_id, token) FROM stdin;
\.


--
-- TOC entry 3574 (class 0 OID 37759)
-- Dependencies: 263
-- Data for Name: sec_resource_policy; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_resource_policy (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, type_, policy_group, resource_, action_, effect, role_id) FROM stdin;
\.


--
-- TOC entry 3572 (class 0 OID 37741)
-- Dependencies: 261
-- Data for Name: sec_resource_role; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_resource_role (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, name, code, child_roles, sys_tenant_id) FROM stdin;
\.


--
-- TOC entry 3538 (class 0 OID 37089)
-- Dependencies: 227
-- Data for Name: sec_role; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_role (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, name, loc_name, description, is_default_role, role_type, security_scope) FROM stdin;
\.


--
-- TOC entry 3576 (class 0 OID 37787)
-- Dependencies: 265
-- Data for Name: sec_role_assignment; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_role_assignment (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, username, role_code, role_type) FROM stdin;
b44d6d0f-98ce-4e15-806f-f0062d5d49ad	1	\N	\N	\N	\N	\N	\N	admin	system-full-access	resource
\.


--
-- TOC entry 3575 (class 0 OID 37773)
-- Dependencies: 264
-- Data for Name: sec_row_level_policy; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_row_level_policy (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, type_, action_, entity_name, where_clause, join_clause, script_, role_id) FROM stdin;
\.


--
-- TOC entry 3573 (class 0 OID 37750)
-- Dependencies: 262
-- Data for Name: sec_row_level_role; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_row_level_role (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, name, code, child_roles, sys_tenant_id) FROM stdin;
\.


--
-- TOC entry 3539 (class 0 OID 37096)
-- Dependencies: 228
-- Data for Name: sec_screen_history; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_screen_history (id, create_ts, created_by, sys_tenant_id, user_id, caption, url, entity_id, string_entity_id, int_entity_id, long_entity_id, substituted_user_id) FROM stdin;
78910d4d-d8b5-ccbf-ef22-14993c00e615	2021-03-05 11:59:05.657	admin	\N	60885987-1b61-4247-94c7-dff348347f93	New User	http://localhost:8080/app/open?screen=sec$User.edit&item=sec$User-67f5b06c-5259-6a89-b0bc-16c09e8b1dc3&params=item:sec$User-67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	\N	\N	\N	\N
\.


--
-- TOC entry 3540 (class 0 OID 37102)
-- Dependencies: 229
-- Data for Name: sec_search_folder; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_search_folder (folder_id, filter_component, filter_xml, user_id, presentation_id, apply_default, is_set, entity_type) FROM stdin;
\.


--
-- TOC entry 3541 (class 0 OID 37108)
-- Dependencies: 230
-- Data for Name: sec_session_attr; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_session_attr (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, name, str_value, datatype, group_id) FROM stdin;
\.


--
-- TOC entry 3542 (class 0 OID 37115)
-- Dependencies: 231
-- Data for Name: sec_session_log; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_session_log (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, session_id, user_id, substituted_user_id, user_data, last_action, client_info, client_type, address, started_ts, finished_ts, server_id) FROM stdin;
\.


--
-- TOC entry 3543 (class 0 OID 37122)
-- Dependencies: 232
-- Data for Name: sec_user; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_user (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, login, login_lc, password, password_encryption, name, first_name, last_name, middle_name, position_, email, language_, time_zone, time_zone_auto, active, group_id, group_names, ip_mask, change_password_at_logon, username, enabled) FROM stdin;
60885987-1b61-4247-94c7-dff348347f93	2021-03-02 16:39:03.411659	\N	1	2021-03-04 13:43:18.94	admin	\N	\N	\N	admin	admin	{bcrypt}$2a$10$vQx8b8B7jzZ0rQmtuK4YDOKp7nkmUCFjPx6DMT.voPtetNHFOsaOu	bcrypt	Administrator	\N	\N	\N	\N	\N	\N	\N	f	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N	\N	admin	t
67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	2021-03-05 11:59:05.607	admin	1	2021-03-05 11:59:05.607	\N	\N	\N	\N	resource-scheduler	resource-scheduler	{bcrypt}$2a$10$QiO21JiD/xKWgEa.Dt2IXOb8n2NUK7ztYf.D0sipQ5Jhy0Ov81VSO	bcrypt	\N	\N	\N	\N	\N	\N	en	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N	f	resource-scheduler	t
a405db59-e674-4f63-8afe-269dda788fe8	2021-03-02 16:39:03.413685	\N	0	\N	\N	\N	\N	\N	anonymous	anonymous	{noop}1	noop	Anonymous	\N	\N	\N	\N	\N	\N	\N	\N	t	0fa2b1a5-1d68-4d69-9fbd-dff348347f93	\N	\N	\N	anonymous	t
\.


--
-- TOC entry 3544 (class 0 OID 37129)
-- Dependencies: 233
-- Data for Name: sec_user_role; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_user_role (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, user_id, role_id, role_name) FROM stdin;
6736effb-9dfc-4430-973a-69868606b09c	2021-03-02 16:39:03.415372	\N	0	\N	\N	\N	\N	60885987-1b61-4247-94c7-dff348347f93	\N	system-full-access
ae39ff41-1ba4-ee12-2356-03b517abe94a	2021-03-05 11:59:05.614	admin	1	2021-03-05 11:59:05.614	\N	\N	\N	67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	\N	system-full-access
ba07ae63-3970-ea15-db24-cde144f5306f	2021-03-05 11:59:05.614	admin	1	2021-03-05 11:59:05.614	\N	\N	\N	67f5b06c-5259-6a89-b0bc-16c09e8b1dc3	\N	system-minimal
\.


--
-- TOC entry 3545 (class 0 OID 37133)
-- Dependencies: 234
-- Data for Name: sec_user_setting; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_user_setting (id, create_ts, created_by, user_id, client_type, name, value_) FROM stdin;
a3370525-3fca-2a1b-a1d4-65f3fa28aedf	2021-03-02 16:57:26.82	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Laboratory.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="split"/>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="table"/>\n  </components>\n</settings>\n
55d57ab5-acd8-67b2-3093-a6bfb838bcee	2021-03-02 16:57:39.178	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Rat.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="ratsTable"/>\n  </components>\n</settings>\n
da4097da-89c6-21be-2f05-cf467697e0f7	2021-03-02 17:01:09.874	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Certificate.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="certificatesTable"/>\n  </components>\n</settings>\n
55d8f59d-454d-5076-430f-a747653d7433	2021-03-02 17:01:58.02	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Employee.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="employeesTable"/>\n  </components>\n</settings>\n
4ca632e1-69d1-9507-4117-718f58f40a05	2021-03-02 17:02:03.075	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_MiscResource.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="split"/>\n    <component name="filter">\n      <defaultFilter/>\n    </component>\n    <component name="table"/>\n  </components>\n</settings>\n
a0a343af-f751-6de3-0df2-f3c130c9173e	2021-03-05 13:11:09.776	admin	60885987-1b61-4247-94c7-dff348347f93	W	sec$User.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="genericFilter">\n      <defaultFilter/>\n    </component>\n    <component name="usersTable" textSelection="false" presentation=""/>\n  </components>\n</settings>\n
763e178d-ea1c-6be0-1cfc-877babb1be0b	2021-03-03 21:51:04.051	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Employee.edit	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings> \n  <components> \n    <component name="certificatesTable" textSelection="false" presentation=""/> \n  </components> \n</settings>\n
47b72763-35b5-c532-7404-29c3275e640a	2021-03-04 11:40:25.612	admin	60885987-1b61-4247-94c7-dff348347f93	W	commonLookup	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filter">\n      <defaultFilter/>\n      <maxResults>100</maxResults>\n    </component>\n    <component name="table"/>\n  </components>\n</settings>\n
4a0ff298-315a-9911-302a-a56ae2bbf669	2021-03-04 11:45:24.519	admin	60885987-1b61-4247-94c7-dff348347f93	W	report$ReportGroup.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="filterWithoutId">\n      <defaultFilter/>\n    </component>\n    <component name="reportGroupsTable"/>\n  </components>\n</settings>\n
c5f485ad-a431-2a05-1118-81068365f513	2021-03-04 11:45:27.436	admin	60885987-1b61-4247-94c7-dff348347f93	W	report$Report.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="genericFilter">\n      <defaultFilter/>\n    </component>\n    <component name="table">\n      <columns sortProperty="group" sortAscending="true">\n        <columns id="group" width="200" visible="true"/>\n        <columns id="locName" visible="true"/>\n        <columns id="description" visible="true"/>\n        <columns id="code" visible="true"/>\n      </columns>\n    </component>\n  </components>\n</settings>\n
69cae5fa-954d-2e7e-918c-7c1810103d5d	2021-03-04 11:51:52.983	admin	60885987-1b61-4247-94c7-dff348347f93	W	sys$Category.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="categoriesFilter">\n      <defaultFilter/>\n    </component>\n    <component name="split"/>\n    <component name="categoryTable"/>\n    <component name="attributesTable"/>\n  </components>\n</settings>\n
a1e3aebd-f47a-7c99-26fb-c177bbda547f	2021-03-04 11:51:50.529	admin	60885987-1b61-4247-94c7-dff348347f93	W	sys$Category.edit	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings> \n  <components> \n    <component name="localizedGroupBox"/>  \n    <component name="categoryAttrsFrame.categoryAttrsTable" textSelection="false" presentation=""/>  \n    <component name="attributesLocationFrame.sourceDataGrid"/> \n  </components> \n</settings>\n
63d7db02-f69e-b3ad-9244-9318183e2cec	2021-03-04 13:43:18.927	admin	60885987-1b61-4247-94c7-dff348347f93	W	appWindowMode	TABBED
304a63cb-aeff-3ef9-a9e5-2e44163f170f	2021-03-04 13:43:18.952	admin	60885987-1b61-4247-94c7-dff348347f93	W	userDefaultScreen	\N
279dff30-bc39-7abd-a9fe-b5d6a95ecdb0	2021-03-04 13:43:18.916	admin	60885987-1b61-4247-94c7-dff348347f93	W	appWindowTheme	hover
d1fb19a7-0f6c-8040-8f2a-eebb5d0c5a44	2021-03-02 19:27:22.25	admin	60885987-1b61-4247-94c7-dff348347f93	W	ratlab_Research.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings> \n  <components> \n    <component name="split"> \n      <position value="41.017487" unit="%"/> \n    </component>  \n    <component name="filter"> \n      <defaultFilter/> \n    </component>  \n    <component name="table"/>  \n    <component name="employeesTable"/>  \n    <component name="resourceRequirementsTable" textSelection="false" presentation=""/>  \n    <component name="subjectRequirementsTable"/> \n  </components> \n</settings>\n
23449359-aeae-8b27-b9ae-359292d534af	2021-03-05 11:59:08.276	admin	60885987-1b61-4247-94c7-dff348347f93	W	sec$User.lookup	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="genericFilter">\n      <defaultFilter/>\n    </component>\n    <component name="usersTable"/>\n  </components>\n</settings>\n
0bb9f98d-096c-a73b-1990-fe42ba180234	2021-03-05 12:02:41.905	admin	60885987-1b61-4247-94c7-dff348347f93	W	sys$ScheduledRunningTasksScreen	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="tasksFilter">\n      <defaultFilter/>\n    </component>\n    <component name="scheduledTasksTable"/>\n  </components>\n</settings>\n
\.


--
-- TOC entry 3546 (class 0 OID 37139)
-- Dependencies: 235
-- Data for Name: sec_user_substitution; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sec_user_substitution (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, user_id, substituted_user_id, start_date, end_date) FROM stdin;
\.


--
-- TOC entry 3547 (class 0 OID 37143)
-- Dependencies: 236
-- Data for Name: sys_app_folder; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_app_folder (folder_id, filter_component, filter_xml, visibility_script, quantity_script, apply_default) FROM stdin;
\.


--
-- TOC entry 3548 (class 0 OID 37149)
-- Dependencies: 237
-- Data for Name: sys_attr_value; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_attr_value (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, category_attr_id, code, entity_id, string_entity_id, int_entity_id, long_entity_id, string_value, integer_value, double_value, decimal_value, date_value, date_wo_time_value, boolean_value, entity_value, string_entity_value, int_entity_value, long_entity_value, parent_id) FROM stdin;
0fc1ce6f-7f3a-0dd9-c0ad-4b6316901d25	2021-03-04 13:42:57.79	admin	1	2021-03-04 13:42:57.79	\N	\N	\N	460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	note_main	0630c942-5a35-c576-b7d3-135976e781f4	\N	\N	\N	Owes 2 reports	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
93ef0ec0-549e-4e2c-6b87-907f21bc53d8	2021-03-05 11:43:34.072	admin	1	2021-03-05 11:43:34.072	\N	\N	\N	460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	note_main	9e79e75c-d264-16ca-c605-87e569dc55ee	\N	\N	\N	ddd	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
b4f3369d-a7cc-d5a2-51ae-d38a1b475c74	2021-03-05 11:47:45.064	admin	1	2021-03-05 11:47:45.064	\N	\N	\N	460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	note_main	bdb01fff-a8f4-37ac-e93c-eaca2fbc86cc	\N	\N	\N	test vasiliy!!	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
e4d96ceb-dcdf-2f72-d3be-274ab8dda4ea	2021-03-05 14:11:15.568	admin	1	2021-03-05 14:11:15.568	\N	\N	\N	460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	note_main	7be1ca03-1905-e711-87c1-9f1ad812ba20	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3549 (class 0 OID 37156)
-- Dependencies: 238
-- Data for Name: sys_category; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_category (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, special, entity_type, is_default, discriminator, locale_names) FROM stdin;
7d857b18-15bb-423b-ab88-4faa21b3a216	2021-03-04 11:51:50.495	admin	1	2021-03-04 11:51:50.495	\N	\N	\N	Заметка	\N	ratlab_Employee	t	0	\N
\.


--
-- TOC entry 3550 (class 0 OID 37163)
-- Dependencies: 239
-- Data for Name: sys_category_attr; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_category_attr (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, category_entity_type, name, code, description, category_id, entity_class, data_type, default_string, default_int, default_double, default_decimal, default_date, default_date_wo_time, default_date_is_current, default_boolean, default_entity_value, default_str_entity_value, default_int_entity_value, default_long_entity_value, enumeration, order_no, screen, required, lookup, target_screens, width, rows_count, is_collection, join_clause, where_clause, filter_xml, locale_names, locale_descriptions, enumeration_locales, attribute_configuration_json) FROM stdin;
460c3ff2-41a4-4a3b-da3f-c91a25e89cd9	2021-03-04 11:51:50.482	admin	1	2021-03-04 11:51:50.482	\N	\N	\N	ratlab_Employee	Основное	note_main	Основная заметка	7d857b18-15bb-423b-ab88-4faa21b3a216	\N	STRING	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	f	f	ratlab_Employee.edit#form,ratlab_Employee.browse#employeesTable	\N	\N	f	\N	\N	\N	\N	\N	\N	{"id":"460c3ff2-41a4-4a3b-da3f-c91a25e89cd9-Configuration","__state":1}
\.


--
-- TOC entry 3551 (class 0 OID 37170)
-- Dependencies: 240
-- Data for Name: sys_config; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_config (id, create_ts, created_by, version, update_ts, updated_by, name, value_) FROM stdin;
a48b200a-fb61-1af5-b3a0-a0fca3ac0ada	2021-03-05 13:07:44.071	admin	1	2021-03-05 13:07:44.071	\N	cuba.schedulingActive	true
\.


--
-- TOC entry 3552 (class 0 OID 37177)
-- Dependencies: 241
-- Data for Name: sys_db_changelog; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_db_changelog (script_name, create_ts, is_init) FROM stdin;
10-cuba/init/postgres/create-db.sql	2021-03-02 16:39:03.427875	1
10-cuba/update/postgres/01/01-010-addValueIdToEntityLog.sql	2021-03-02 16:39:03.443774	1
10-cuba/update/postgres/01/01-020-dropDbUpdatePKey.sql	2021-03-02 16:39:03.448158	1
10-cuba/update/postgres/01/01-030-add_EntityLogAttr_messagesPack.sql	2021-03-02 16:39:03.45217	1
10-cuba/update/postgres/01/01-040-renameUserPosition.sql	2021-03-02 16:39:03.456926	1
10-cuba/update/postgres/01/01-050-addUserLanguage.sql	2021-03-02 16:39:03.460492	1
10-cuba/update/postgres/01/01-050-sysFtsQueue.sql	2021-03-02 16:39:03.46375	1
10-cuba/update/postgres/01/01-055-createReportTables.sql	2021-03-02 16:39:03.466909	1
10-cuba/update/postgres/01/01-060-addReportParameterPosition.sql	2021-03-02 16:39:03.470139	1
10-cuba/update/postgres/01/01-070-addCodeInFolder.sql	2021-03-02 16:39:03.473253	1
10-cuba/update/postgres/01/01-080-SessionAttributes.sql	2021-03-02 16:39:03.476071	1
10-cuba/update/postgres/01/01-090-ChangeReportKeys.sql	2021-03-02 16:39:03.479064	1
10-cuba/update/postgres/01/01-100-EntityStatistics.sql	2021-03-02 16:39:03.481869	1
10-cuba/update/postgres/01/01-100-addPresentations.sql	2021-03-02 16:39:03.484736	1
10-cuba/update/postgres/01/01-110-AddFieldInSysFolder.sql	2021-03-02 16:39:03.487699	1
10-cuba/update/postgres/01/01-120-AddCodeFieldInSecFilter.sql	2021-03-02 16:39:03.490244	1
10-cuba/update/postgres/01/01-130-createReportValueFormatTable.sql	2021-03-02 16:39:03.493024	1
10-cuba/update/postgres/01/01-140-AddTabHistory.sql	2021-03-02 16:39:03.495709	1
10-cuba/update/postgres/01/01-150-CreateIndexes.sql	2021-03-02 16:39:03.498347	1
10-cuba/update/postgres/01/01-160-screenHistory.sql	2021-03-02 16:39:03.501328	1
10-cuba/update/postgres/01/01-170-entityStatisticsFetchUI.sql	2021-03-02 16:39:03.504245	1
10-cuba/update/postgres/01/01-180-changeAppFoldersScriptsLength.sql	2021-03-02 16:39:03.507162	1
10-cuba/update/postgres/01/01-190-renameDoubleNameInSysFolder.sql	2021-03-02 16:39:03.50987	1
10-cuba/update/postgres/01/01-200-deleteCodeInSysFolders.sql	2021-03-02 16:39:03.512399	1
10-cuba/update/postgres/01/01-210-updateTabNameInSysFolder.sql	2021-03-02 16:39:03.515026	1
10-cuba/update/postgres/01/01-220-reportTablesChangeColumns.sql	2021-03-02 16:39:03.517577	1
10-cuba/update/postgres/01/01-230-reportParameterAddEnumClass.sql	2021-03-02 16:39:03.519969	1
10-cuba/update/postgres/01/01-240-userIpMask.sql	2021-03-02 16:39:03.522422	1
10-cuba/update/postgres/01/01-250-entityStatLookupScreenThreshold.sql	2021-03-02 16:39:03.52492	1
10-cuba/update/postgres/01/01-260-reportTemplatesTable.sql	2021-03-02 16:39:03.527473	1
10-cuba/update/postgres/01/01-270-sendingMessagesHistory.sql	2021-03-02 16:39:03.529944	1
10-cuba/update/postgres/01/01-280-addApplyDefault.sql	2021-03-02 16:39:03.532598	1
10-cuba/update/postgres/01/01-290-addIsSetToSearchFolder.sql	2021-03-02 16:39:03.535031	1
10-cuba/update/postgres/01/01-300-addEntitySnapshotTable.sql	2021-03-02 16:39:03.537702	1
10-cuba/update/postgres/01/01-310-RuntimePropertiesTables.sql	2021-03-02 16:39:03.540563	1
10-cuba/update/postgres/01/01-320-RuntimePropertiesRework.sql	2021-03-02 16:39:03.543421	1
10-cuba/update/postgres/01/01-330-CategoryAttrAlterType.sql	2021-03-02 16:39:03.546101	1
10-cuba/update/postgres/01/01-340-CategoryDiscriminator.sql	2021-03-02 16:39:03.549036	1
10-cuba/update/postgres/01/01-350-categoryAttrOrderNo.sql	2021-03-02 16:39:03.551565	1
10-cuba/update/postgres/01/01-360-CategoryAttrScreen.sql	2021-03-02 16:39:03.554146	1
10-cuba/update/postgres/01/01-370-CategoryAttrRequired.sql	2021-03-02 16:39:03.557306	1
10-cuba/update/postgres/01/01-380-AlterTypeColumnUrlInScreenHistory.sql	2021-03-02 16:39:03.559878	1
10-cuba/update/postgres/01/01-390-AlterTableSysCategoryAttr.sql	2021-03-02 16:39:03.562589	1
10-cuba/update/postgres/01/01-400-AlterTableSysAttrValue.sql	2021-03-02 16:39:03.565145	1
10-cuba/update/postgres/01/01-410-addDataSetParams.sql	2021-03-02 16:39:03.567705	1
10-cuba/update/postgres/01/01-410-addStartDateToUserSubstitution.sql	2021-03-02 16:39:03.570228	1
10-cuba/update/postgres/01/01-420-addEntityIdToScreenHistory.sql	2021-03-02 16:39:03.57285	1
10-cuba/update/postgres/01/01-440-addDropdownToCategoryAttribute.sql	2021-03-02 16:39:03.575651	1
10-cuba/update/postgres/01/01-450-alterSecConstraint.sql	2021-03-02 16:39:03.578134	1
10-cuba/update/postgres/02/02-010-addScheduledTasks.sql	2021-03-02 16:39:03.580741	1
10-cuba/update/postgres/02/02-020-alterDoubleValueColumnInSysAttrValueTable.sql	2021-03-02 16:39:03.58384	1
10-cuba/update/postgres/02/02-030-addReportGroup.sql	2021-03-02 16:39:03.586548	1
10-cuba/update/postgres/02/02-040-addReportRefToBand.sql	2021-03-02 16:39:03.589208	1
10-cuba/update/postgres/02/02-050-reportLocales.sql	2021-03-02 16:39:03.592101	1
10-cuba/update/postgres/02/02-060-reportCode.sql	2021-03-02 16:39:03.594581	1
10-cuba/update/postgres/02/02-070-addRoleType.sql	2021-03-02 16:39:03.597112	1
10-cuba/update/postgres/02/02-080-addSnapshotDate.sql	2021-03-02 16:39:03.599782	1
10-cuba/update/postgres/02/02-090-schedulingDaylightSaving.sql	2021-03-02 16:39:03.602464	1
10-cuba/update/postgres/02/02-100-entitySnapshotAuthor.sql	2021-03-02 16:39:03.604961	1
10-cuba/update/postgres/02/02-110-addDefaultDateIsCurrent.sql	2021-03-02 16:39:03.607588	1
10-cuba/update/postgres/02/02-120-addUserDescriminator.sql	2021-03-02 16:39:03.609929	1
10-cuba/update/postgres/02/02-130-alterSecConstraint.sql	2021-03-02 16:39:03.612363	1
10-cuba/update/postgres/02/02-130-queryResults.sql	2021-03-02 16:39:03.614795	1
10-cuba/update/postgres/02/02-140-entityLogChanges.sql	2021-03-02 16:39:03.617187	1
10-cuba/update/postgres/02/02-150-alterSysScheduledTask.sql	2021-03-02 16:39:03.619946	1
10-cuba/update/postgres/12/121002-updateScreenPermissions.sql	2021-03-02 16:39:03.622762	1
10-cuba/update/postgres/12/121003-addCodeToCategoryAttribute.sql	2021-03-02 16:39:03.625999	1
10-cuba/update/postgres/12/121004-addFieldsToScheduledTasks.sql	2021-03-02 16:39:03.629112	1
10-cuba/update/postgres/12/121020-addLoginConstraintsForUser.sql	2021-03-02 16:39:03.631817	1
10-cuba/update/postgres/12/121024-addEncryptionParamsToUser.sql	2021-03-02 16:39:03.634319	1
10-cuba/update/postgres/12/121031-dropPasswordColumnFromScheduledTask.sql	2021-03-02 16:39:03.636875	1
10-cuba/update/postgres/12/121102-dropSaltColumn.sql	2021-03-02 16:39:03.639474	1
10-cuba/update/postgres/12/121114-addDescriptionToScheduledTask.sql	2021-03-02 16:39:03.642408	1
10-cuba/update/postgres/12/121228-addJmxInstance.sql	2021-03-02 16:39:03.644891	1
10-cuba/update/postgres/13/130110-removeJmxInstanceDescription.sql	2021-03-02 16:39:03.647692	1
10-cuba/update/postgres/13/130311-renameColumnsForOracle.sql	2021-03-02 16:39:03.650323	1
10-cuba/update/postgres/13/130731-changeServerEntity.sql	2021-03-02 16:39:03.652679	1
10-cuba/update/postgres/13/130918-email-attachment-options.sql	2021-03-02 16:39:03.655167	1
10-cuba/update/postgres/13/130920-email-file-storage.sql	2021-03-02 16:39:03.65779	1
10-cuba/update/postgres/13/130923-permissionsToRenamedScreens.sql	2021-03-02 16:39:03.660079	1
10-cuba/update/postgres/13/131108-sending-message-timeshift.sql	2021-03-02 16:39:03.662568	1
10-cuba/update/postgres/13/131112-scheduled-task-cron.sql	2021-03-02 16:39:03.664815	1
10-cuba/update/postgres/14/140313-ftsQueueIndexingHost.sql	2021-03-02 16:39:03.667077	1
10-cuba/update/postgres/14/140405-changeTypeForSysConfigValue.sql	2021-03-02 16:39:03.669334	1
10-cuba/update/postgres/14/140708-addRememberMeTable.sql	2021-03-02 16:39:03.67178	1
10-cuba/update/postgres/14/140716-changeSysFileSizeType.sql	2021-03-02 16:39:03.674094	1
10-cuba/update/postgres/14/141203-setNotNullSysFileName.sql	2021-03-02 16:39:03.676536	1
10-cuba/update/postgres/15/150203-sendingMessageEmailHeaders.sql	2021-03-02 16:39:03.678874	1
10-cuba/update/postgres/15/150203-userTimeZone.sql	2021-03-02 16:39:03.681218	1
10-cuba/update/postgres/15/150205-addSubstituteUserInScreenHistory.sql	2021-03-02 16:39:03.683677	1
10-cuba/update/postgres/15/150226-addIndexInScreenHistory.sql	2021-03-02 16:39:03.686	1
10-cuba/update/postgres/15/150310-alterFilterXml.sql	2021-03-02 16:39:03.688496	1
10-cuba/update/postgres/15/150417-runtimePropertiesChanges.sql	2021-03-02 16:39:03.690751	1
10-cuba/update/postgres/15/150514-categoryEntityTypeInAttribute.sql	2021-03-02 16:39:03.693191	1
10-cuba/update/postgres/15/150630-entityClassToCategoryAttribute.sql	2021-03-02 16:39:03.69552	1
10-cuba/update/postgres/15/150805-fakeFtsQueue.sql	2021-03-02 16:39:03.697861	1
10-cuba/update/postgres/15/151106-extendScheduledTaskFields.sql	2021-03-02 16:39:03.700387	1
10-cuba/update/postgres/15/151116-rowLevelSecurity.sql	2021-03-02 16:39:03.702706	1
10-cuba/update/postgres/15/151228-sendingMessagesExtendFields.sql	2021-03-02 16:39:03.705058	1
10-cuba/update/postgres/15/1512282-addIsActiveToConstraint.sql	2021-03-02 16:39:03.707356	1
10-cuba/update/postgres/16/160322-dropUniqSysScheduledTaskBeanMethodConstraint.sql	2021-03-02 16:39:03.709717	1
10-cuba/update/postgres/16/160405-createUniqSysCategory.sql	2021-03-02 16:39:03.712112	1
10-cuba/update/postgres/16/160420-createUpdateTsIndexOnSysSendingMessage.sql	2021-03-02 16:39:03.714321	1
10-cuba/update/postgres/16/160616-addSizeCategoryAttribute.sql	2021-03-02 16:39:03.716797	1
10-cuba/update/postgres/16/160626-createIndexOnFinishTimeScheduledExecution.sql	2021-03-02 16:39:03.719078	1
10-cuba/update/postgres/16/160725-anonymousLogin.sql	2021-03-02 16:39:03.721554	1
10-cuba/update/postgres/16/160916-addEntityIdToFtsQueue.sql	2021-03-02 16:39:03.72373	1
10-cuba/update/postgres/16/161024-collectionDynamicAttributes.sql	2021-03-02 16:39:03.726094	1
10-cuba/update/postgres/16/161025-sysAttrValueParentConstraint.sql	2021-03-02 16:39:03.728717	1
10-cuba/update/postgres/16/161102-setIsCollectionForExistingCategoryAttrs.sql	2021-03-02 16:39:03.731272	1
10-cuba/update/postgres/16/161124-FilterXmlInCategoryAttr.sql	2021-03-02 16:39:03.733846	1
10-cuba/update/postgres/16/161124-joinAndWhereInCategoryAttr.sql	2021-03-02 16:39:03.736557	1
10-cuba/update/postgres/16/270916-addEntityIdToQueryResult.sql	2021-03-02 16:39:03.739175	1
10-cuba/update/postgres/17/170214-addEntityIdToSnapshot.sql	2021-03-02 16:39:03.741792	1
10-cuba/update/postgres/17/170215-addEntityIdToEntityLog.sql	2021-03-02 16:39:03.745198	1
10-cuba/update/postgres/17/170221-addEntityIdToAttributeValue.sql	2021-03-02 16:39:03.748289	1
10-cuba/update/postgres/17/170228-createRestApiTokenTable.sql	2021-03-02 16:39:03.750813	1
10-cuba/update/postgres/17/170502-createSessionHistoryTable.sql	2021-03-02 16:39:03.753386	1
10-cuba/update/postgres/17/170620-alterConstraints.sql	2021-03-02 16:39:03.756513	1
10-cuba/update/postgres/17/170712-createLocalizedConstraintMessageTable.sql	2021-03-02 16:39:03.759128	1
10-cuba/update/postgres/17/170829-addLocaleNameColumnToCategory.sql	2021-03-02 16:39:03.762266	1
10-cuba/update/postgres/17/171002-addUserLoginToRestApiToken.sql	2021-03-02 16:39:03.765009	1
10-cuba/update/postgres/17/171116-addGlobalDefaultToFilterEntity.sql	2021-03-02 16:39:03.76877	1
10-cuba/update/postgres/17/171121-addLocaleToRestApiToken.sql	2021-03-02 16:39:03.771303	1
10-cuba/update/postgres/17/1712011000-createRestApiRefreshTokenTable.sql	2021-03-02 16:39:03.77387	1
10-cuba/update/postgres/17/1712011010-renameRestApiTokenColumns.sql	2021-03-02 16:39:03.776635	1
10-cuba/update/postgres/17/1712011010-renameRestApiTokenTable.sql	2021-03-02 16:39:03.779043	1
10-cuba/update/postgres/17/171227-createIndexStartedTsDescToSessionLog.sql	2021-03-02 16:39:03.781748	1
10-cuba/update/postgres/17/171229-addRefreshTokenColumnToAccessTokenTable.sql	2021-03-02 16:39:03.784552	1
10-cuba/update/postgres/18/180112-alterDynamicAttributeDoubleType.sql	2021-03-02 16:39:03.787694	1
10-cuba/update/postgres/18/180312-renameColumns.sql	2021-03-02 16:39:03.790524	1
10-cuba/update/postgres/18/180321-addContentBodyTypeColumnToSendingMessage.sql	2021-03-02 16:39:03.793186	1
10-cuba/update/postgres/18/180331-truncateQueryResultTable.sql	2021-03-02 16:39:03.795842	1
10-cuba/update/postgres/18/180704-addNotNullForConfig.sql	2021-03-02 16:39:03.79833	1
10-cuba/update/postgres/18/181024-addCcAndBccToSendingMessage.sql	2021-03-02 16:39:03.801002	1
10-cuba/update/postgres/18/181210-addUserPasswordEncryption.sql	2021-03-02 16:39:03.80373	1
10-cuba/update/postgres/18/181227-addScreenHistorySupportedIdTypes.sql	2021-03-02 16:39:03.806358	1
10-cuba/update/postgres/19/190321-addEntityLogInstanceName.sql	2021-03-02 16:39:03.809533	1
10-cuba/update/postgres/19/190326-renameScheduledTaskColumns.sql	2021-03-02 16:39:03.812057	1
10-cuba/update/postgres/19/190408-addNewDynamicAttrType.sql	2021-03-02 16:39:03.814639	1
10-cuba/update/postgres/19/190410-addDescriptionFieldForDynamicAttributes.sql	2021-03-02 16:39:03.817504	1
10-cuba/update/postgres/19/190614-addRoleNameFieldForDesignTimeRoles.sql	2021-03-02 16:39:03.820646	1
10-cuba/update/postgres/19/190627-dynamicAttributesImprovements.sql	2021-03-02 16:39:03.823197	1
10-cuba/update/postgres/19/191030-addGroupNamesForDesignGroups.sql	2021-03-02 16:39:03.825869	1
10-cuba/update/postgres/19/191223-addSysTenantIdForCubaEntities.sql	2021-03-02 16:39:03.828362	1
10-cuba/update/postgres/19/191225-addRoleSecurityScope.sql	2021-03-02 16:39:03.830797	1
10-cuba/update/postgres/19/191226-setDefaultSecurityScope.sql	2021-03-02 16:39:03.833215	1
10-cuba/update/postgres/20/200608-alterScheduledTaskMethodParams.sql	2021-03-02 16:39:03.835837	1
10-cuba/update/postgres/20/201007-fixAttributeName.sql	2021-03-02 16:39:03.838739	1
50-ratlab/update/postgres/21/03/210302-1-createCertificate.sql	2021-03-02 16:39:43.381642	0
50-ratlab/update/postgres/21/03/210302-1-createEmployee.sql	2021-03-02 16:39:43.39753	0
50-ratlab/update/postgres/21/03/210302-1-createEmployeeResearchLink.sql	2021-03-02 16:39:43.409334	0
50-ratlab/update/postgres/21/03/210302-1-createLaboratory.sql	2021-03-02 16:39:43.424392	0
50-ratlab/update/postgres/21/03/210302-1-createMiscResource.sql	2021-03-02 16:39:43.43729	0
50-ratlab/update/postgres/21/03/210302-1-createRat.sql	2021-03-02 16:39:43.455932	0
50-ratlab/update/postgres/21/03/210302-1-createResearch.sql	2021-03-02 16:39:43.470783	0
50-ratlab/update/postgres/21/03/210302-2-createCertificate.sql	2021-03-02 16:39:43.487838	0
50-ratlab/update/postgres/21/03/210302-2-createEmployee.sql	2021-03-02 16:39:43.503154	0
50-ratlab/update/postgres/21/03/210302-2-createEmployeeResearchLink.sql	2021-03-02 16:39:43.513957	0
50-ratlab/update/postgres/21/03/210302-2-createLaboratory.sql	2021-03-02 16:39:43.530124	0
20-reports/init/postgres/create-db.sql	2021-03-04 11:32:35.392097	1
20-reports/update/postgres/02-150-removeReportRootDefinitionId.sql	2021-03-04 11:32:35.406345	1
20-reports/update/postgres/02-170-reportingNotNullConstraints.sql	2021-03-04 11:32:35.410266	1
20-reports/update/postgres/13/130311-renameColumnsForOracle.sql	2021-03-04 11:32:35.414355	1
20-reports/update/postgres/13/130606-addOutputNamePattern.sql	2021-03-04 11:32:35.418314	1
20-reports/update/postgres/13/130828-addDefaultTemplate.sql	2021-03-04 11:32:35.422266	1
20-reports/update/postgres/13/130830-newStructure.sql	2021-03-04 11:32:35.425921	1
20-reports/update/postgres/13/130903-migrateReports.groovy	2021-03-04 11:32:35.42927	1
20-reports/update/postgres/13/130912-reportConstraints.sql	2021-03-04 11:32:35.432942	1
20-reports/update/postgres/14/141105-customDefinedByField.sql	2021-03-04 11:32:35.437378	1
20-reports/update/postgres/16/160427-reportDescriptionField.sql	2021-03-04 11:32:35.441084	1
20-reports/update/postgres/17/170131-addFieldsForAvailableReports.sql	2021-03-04 11:32:35.444864	1
20-reports/update/postgres/17/170201-migrateSecurityIndex.upgrade.groovy	2021-03-04 11:32:35.448436	1
20-reports/update/postgres/17/170825-addSoftDeleteColumns.sql	2021-03-04 11:32:35.452497	1
20-reports/update/postgres/17/170927-addAlterableOutputType.sql	2021-03-04 11:32:35.456121	1
20-reports/update/postgres/17/171102-setDefaultValueForAlterableOutput.sql	2021-03-04 11:32:35.460074	1
20-reports/update/postgres/18/180718-addRestAccessToReport.sql	2021-03-04 11:32:35.465965	1
20-reports/update/postgres/18/180730-addSystemToReport.sql	2021-03-04 11:32:35.469811	1
20-reports/update/postgres/18/181031-addGroovyToReportTemplate.sql	2021-03-04 11:32:35.473736	1
20-reports/update/postgres/19/190717-add-report-execution.sql	2021-03-04 11:32:35.477545	1
20-reports/update/postgres/19/190730-add-execution-output-document.sql	2021-03-04 11:32:35.481679	1
20-reports/update/postgres/19/191223-addSysTenantIdForReportEntities.sql	2021-03-04 11:32:35.485842	1
50-ratlab/update/postgres/21/03/210304-1-createResourceRequirement.sql	2021-03-04 19:55:53.539832	0
50-ratlab/update/postgres/21/03/210304-2-createResourceRequirement.sql	2021-03-04 19:55:53.551821	0
50-ratlab/update/postgres/21/03/210304-2-updateMiscResource.sql	2021-03-04 21:13:21.124971	0
50-ratlab/update/postgres/21/03/210304-2-updateResearch.sql	2021-03-04 22:06:13.042313	0
50-ratlab/update/postgres/21/03/210304-2-updateResourceRequirement.sql	2021-03-04 22:44:30.681389	0
50-ratlab/update/postgres/21/03/210304-2-updateResourceRequirement01.sql	2021-03-04 22:44:30.688959	0
50-ratlab/update/postgres/21/03/210305-0-dropResourceRequirement.sql	2021-03-05 17:38:55.857423	0
50-ratlab/update/postgres/21/03/210305-0-dropResourceRequirement_DropScript.sql	2021-03-05 17:38:55.879733	0
50-ratlab/update/postgres/21/03/210305-1-createResearchRequirement.sql	2021-03-05 17:38:55.90395	0
50-ratlab/update/postgres/21/03/210305-2-createResearchRequirement.sql	2021-03-05 17:38:55.924281	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement.sql	2021-03-05 17:42:01.829371	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement01.sql	2021-03-05 17:52:27.688912	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement02.sql	2021-03-05 18:24:58.113488	0
50-ratlab/update/postgres/21/03/210305-1-createResourceRequirement.sql	2021-03-05 18:44:25.117832	0
50-ratlab/update/postgres/21/03/210305-1-createSubjectRequirement.sql	2021-03-05 18:44:25.125541	0
50-ratlab/update/postgres/21/03/210305-2-createResourceRequirement.sql	2021-03-05 18:44:25.137435	0
50-ratlab/update/postgres/21/03/210305-2-createSubjectRequirement.sql	2021-03-05 18:44:25.149782	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement03.sql	2021-03-05 18:44:25.158113	0
50-ratlab/update/postgres/21/03/210305-2-updateResearchRequirement03_DropScript.sql	2021-03-05 18:44:25.165673	0
\.


--
-- TOC entry 3553 (class 0 OID 37182)
-- Dependencies: 242
-- Data for Name: sys_entity_snapshot; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_entity_snapshot (id, create_ts, created_by, sys_tenant_id, entity_meta_class, entity_id, string_entity_id, int_entity_id, long_entity_id, author_id, view_xml, snapshot_xml, snapshot_date) FROM stdin;
\.


--
-- TOC entry 3554 (class 0 OID 37188)
-- Dependencies: 243
-- Data for Name: sys_entity_statistics; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_entity_statistics (id, create_ts, created_by, update_ts, updated_by, name, instance_count, fetch_ui, max_fetch_ui, lazy_collection_threshold, lookup_screen_threshold) FROM stdin;
\.


--
-- TOC entry 3555 (class 0 OID 37191)
-- Dependencies: 244
-- Data for Name: sys_file; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_file (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, name, ext, file_size, create_date) FROM stdin;
\.


--
-- TOC entry 3556 (class 0 OID 37198)
-- Dependencies: 245
-- Data for Name: sys_folder; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_folder (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, folder_type, parent_id, name, tab_name, sort_order) FROM stdin;
\.


--
-- TOC entry 3557 (class 0 OID 37205)
-- Dependencies: 246
-- Data for Name: sys_fts_queue; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_fts_queue (id, create_ts, created_by, entity_id, string_entity_id, int_entity_id, long_entity_id, entity_name, change_type, source_host, indexing_host, fake) FROM stdin;
\.


--
-- TOC entry 3558 (class 0 OID 37211)
-- Dependencies: 247
-- Data for Name: sys_jmx_instance; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_jmx_instance (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, node_name, address, login, password) FROM stdin;
\.


--
-- TOC entry 3559 (class 0 OID 37218)
-- Dependencies: 248
-- Data for Name: sys_lock_config; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_lock_config (id, create_ts, created_by, name, timeout_sec) FROM stdin;
\.


--
-- TOC entry 3561 (class 0 OID 37223)
-- Dependencies: 250
-- Data for Name: sys_query_result; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_query_result (id, session_id, query_key, entity_id, string_entity_id, int_entity_id, long_entity_id) FROM stdin;
\.


--
-- TOC entry 3562 (class 0 OID 37227)
-- Dependencies: 251
-- Data for Name: sys_scheduled_execution; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_scheduled_execution (id, create_ts, created_by, sys_tenant_id, task_id, server, start_time, finish_time, result) FROM stdin;
2cb1938e-c677-0e77-8d8c-acf2bb13e2d6	2021-03-05 13:03:05.251	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:03:05.211+00	2021-03-05 09:03:05.295+00	\n{Executed manually}
fa273ff7-1501-1f1b-26d7-f782b302ede2	2021-03-05 13:03:07.411	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:03:07.41+00	2021-03-05 09:03:07.445+00	\n{Executed manually}
d29bfc04-9d5e-6267-f9bd-77cf9c005126	2021-03-05 13:07:44.772	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:07:44.771+00	2021-03-05 09:07:44.805+00	
692db1b6-8898-646b-00c9-24655c91253d	2021-03-05 13:08:45.767	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:08:45.766+00	2021-03-05 09:08:45.798+00	
1a3881f4-ee96-d79e-b7b6-101d161a8e85	2021-03-05 13:10:46.766	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:10:46.765+00	2021-03-05 09:10:46.795+00	
16336b25-571c-dcec-97a7-bde7d9666e96	2021-03-05 13:12:46.8	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:12:46.799+00	2021-03-05 09:12:46.829+00	
510ae352-582e-d2cd-f809-67609b3a39b8	2021-03-05 13:14:46.8	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:14:46.799+00	2021-03-05 09:14:46.827+00	
c858ade6-5d08-f695-2e5e-31be3cca20e5	2021-03-05 13:16:47.799	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:16:47.797+00	2021-03-05 09:16:47.825+00	
b2d76c73-25ea-e109-1cdf-a62ab73b29ec	2021-03-05 13:18:48.798	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:18:48.797+00	2021-03-05 09:18:48.825+00	
eeecb863-f8b9-37ef-de59-fe2bee03324d	2021-03-05 13:24:07.067	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:24:07.001+00	2021-03-05 09:24:07.121+00	java.lang.RuntimeException: java.lang.NoSuchMethodException: com.sun.proxy.$Proxy272.addConsumables()
9e6c8e4c-325d-d255-a2fa-f5d57aca5c44	2021-03-05 13:26:07.532	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:26:07.531+00	2021-03-05 09:26:07.58+00	Tape:12012.00->12013.00|R2:24.00->25.00|R1:18.00->19.00|
4963705e-ef1b-3313-72c2-6525762a4b78	2021-03-05 13:28:07.566	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:28:07.564+00	2021-03-05 09:28:07.598+00	Tape:12013.00->12014.00|R2:25.00->26.00|R1:19.00->20.00|
7c0a9d16-d80f-6b03-9545-29f225f1df30	2021-03-05 13:30:08.564	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:30:08.563+00	2021-03-05 09:30:08.593+00	Tape:12014.00->12015.00|R2:26.00->27.00|R1:20.00->21.00|
ebe4ef1e-d204-6592-a8c7-a55bac10339f	2021-03-05 13:32:09.562	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:32:09.561+00	2021-03-05 09:32:09.589+00	Tape:12015.00->12016.00|R2:27.00->28.00|R1:21.00->22.00|
dbd388b0-d2fb-21f8-92a7-6d3ef2f7ab5d	2021-03-05 13:34:10.562	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:34:10.561+00	2021-03-05 09:34:10.587+00	Tape:12016.00->12017.00|R2:28.00->29.00|R1:22.00->23.00|
2054550f-19a6-56be-595a-9bc573be2680	2021-03-05 13:36:10.563	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:36:10.562+00	2021-03-05 09:36:10.59+00	Tape:12017.00->12018.00|R2:29.00->30.00|R1:23.00->24.00|
bff73590-a6bb-71da-2cbf-3aa73ee7ca9c	2021-03-05 13:38:10.564	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:38:10.563+00	2021-03-05 09:38:10.59+00	Tape:12018.00->12019.00|R2:30.00->31.00|R1:24.00->25.00|
3b44b8da-0e81-4b51-cf83-da4c628152ec	2021-03-05 13:40:10.567	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:40:10.566+00	2021-03-05 09:40:10.595+00	Tape:12019.00->12020.00|R2:31.00->32.00|R1:25.00->26.00|
2508a3d1-f0c1-cbb6-c377-13fc44c15fca	2021-03-05 13:58:38.948	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 09:58:38.946+00	2021-03-05 09:58:39.305+00	Tape:12020.00->12021.00|R2:32.00->33.00|R1:26.00->27.00|
05b1c478-e676-33ef-c93f-9a8e0fcba8b3	2021-03-05 14:00:39.207	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:00:39.206+00	2021-03-05 10:00:39.238+00	Tape:12021.00->12022.00|R2:33.00->34.00|R1:27.00->28.00|
4ae03621-4a97-1648-a93e-f43b1a6fc02d	2021-03-05 14:02:39.212	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:02:39.211+00	2021-03-05 10:02:39.24+00	Tape:12022.00->12023.00|R2:34.00->35.00|R1:28.00->29.00|
65f65506-d549-64c9-fb10-980a1cb08f5e	2021-03-05 14:04:39.213	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:04:39.213+00	2021-03-05 10:04:39.246+00	Tape:12023.00->12024.00|R2:35.00->36.00|R1:29.00->30.00|
dcd86173-3cf4-2f84-5875-00312d453506	2021-03-05 14:06:39.221	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:06:39.22+00	2021-03-05 10:06:39.251+00	Tape:12024.00->12025.00|R2:36.00->37.00|R1:30.00->31.00|
abac01b7-bfd0-4141-fc46-22e43b0798f3	2021-03-05 14:08:40.223	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:08:40.221+00	2021-03-05 10:08:40.253+00	Tape:12025.00->12026.00|R2:37.00->38.00|R1:31.00->32.00|
33890484-1069-0d7c-4628-7c37ad6e2ecf	2021-03-05 14:10:14.368	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:10:14.292+00	2021-03-05 10:10:14.557+00	Tape:12026->12027|R2:38->39|R1:32->33|
983d75b6-36c4-ae06-2a4a-cc5c814b81a7	2021-03-05 14:12:14.62	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:12:14.619+00	2021-03-05 10:12:14.662+00	Tape:12027->12028|R2:39->40|R1:33->34|
97cf1013-7fb7-0376-dd45-d850e5157fad	2021-03-05 14:14:14.622	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:14:14.621+00	2021-03-05 10:14:14.658+00	Tape:12028->12029|R2:40->41|R1:34->35|
debbd12e-f08d-72e1-ce76-993c6266274d	2021-03-05 14:16:14.624	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:16:14.623+00	2021-03-05 10:16:14.657+00	Tape:12029->12030|R2:41->42|R1:35->36|
d9b8c248-8951-5c76-298d-159ac7e553c1	2021-03-05 14:18:14.634	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:18:14.633+00	2021-03-05 10:18:14.666+00	Tape:12030->12031|R2:42->43|R1:36->37|
06341f79-6bc2-a706-7e86-262c98ecc6b8	2021-03-05 14:20:15.631	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:20:15.63+00	2021-03-05 10:20:15.661+00	Tape:12031->12032|R2:43->44|R1:37->38|
14f4782c-855f-7bf8-169c-00333d211627	2021-03-05 14:22:15.638	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:22:15.637+00	2021-03-05 10:22:15.67+00	Tape:12032->12033|R2:44->45|R1:38->39|
5ac91e2c-91a0-4412-4d6a-cf2757e9a95b	2021-03-05 14:47:16.786	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 10:47:16.785+00	2021-03-05 10:47:17.192+00	Tape:12033->12034|R2:45->46|R1:39->40|
d3b18823-53e8-2efe-49cb-111dcd37d043	2021-03-05 15:13:20.907	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:13:20.906+00	2021-03-05 11:13:21.302+00	Tape:12034->12035|R2:46->47|R1:40->41|
7d23cc11-41e0-8a2b-794a-095eba02e357	2021-03-05 15:15:21.51	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:15:21.509+00	2021-03-05 11:15:21.54+00	Tape:12035->12036|R2:47->48|R1:41->42|
9928ac6a-f4d6-f491-37e7-2722063f5f67	2021-03-05 15:17:21.511	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:17:21.51+00	2021-03-05 11:17:21.538+00	Tape:12036->12037|R2:48->49|R1:42->43|
035f1d4f-00d8-0b10-a2c1-bfeb20605e81	2021-03-05 15:19:21.512	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:19:21.512+00	2021-03-05 11:19:21.539+00	Tape:12037->12038|R2:49->50|R1:43->44|
ce2a79dc-d0a7-799c-7af1-5577886c3218	2021-03-05 15:21:22.506	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:21:22.505+00	2021-03-05 11:21:22.535+00	Tape:12038->12039|R2:50->51|R1:44->45|
8d595286-91aa-dd88-5193-fda50d51170f	2021-03-05 15:23:22.511	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:23:22.51+00	2021-03-05 11:23:22.543+00	Tape:12039->12040|R2:51->52|R1:45->46|
34c4a671-2296-0e00-3a11-607cc39d2667	2021-03-05 15:25:23.51	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 11:25:23.509+00	2021-03-05 11:25:23.538+00	Tape:12040->12041|R2:52->53|R1:46->47|
057349f2-e95d-82c8-678d-41e9a6ea9caa	2021-03-05 17:39:13.625	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:39:13.558+00	2021-03-05 13:39:13.85+00	Tape:12041->12042|R2:53->54|R1:47->48|
824b1737-c597-b713-66f2-58e28db222c5	2021-03-05 17:41:14.082	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:41:14.081+00	2021-03-05 13:41:14.118+00	Tape:12042->12043|R2:54->55|R1:48->49|
2fbcb11c-4b90-9f24-e26e-9e3fef83f4c4	2021-03-05 17:42:19.029	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:42:18.937+00	2021-03-05 13:42:19.198+00	Tape:12043->12044|R2:55->56|R1:49->50|
781c6cc6-46da-60d7-9977-1d8ebcc7f0ec	2021-03-05 17:44:19.457	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:44:19.456+00	2021-03-05 13:44:19.495+00	Tape:12044->12045|R2:56->57|R1:50->51|
dcb6fd9b-ab44-cbba-e261-d6602fa445a4	2021-03-05 17:46:19.457	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:46:19.456+00	2021-03-05 13:46:19.49+00	Tape:12045->12046|R2:57->58|R1:51->52|
9098150c-979c-bd69-2b48-9bcb033abd1a	2021-03-05 17:48:19.459	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:48:19.458+00	2021-03-05 13:48:19.499+00	Tape:12046->12047|R2:58->59|R1:52->53|
39859f58-e2bd-f915-a0a7-9bafa6ad765b	2021-03-05 17:49:40.686	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:49:40.605+00	2021-03-05 13:49:40.916+00	Tape:12047->12048|R2:59->60|R1:53->54|
d36d6226-f22e-5c7c-a7bf-b4aafb8c2657	2021-03-05 17:51:40.762	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:51:40.761+00	2021-03-05 13:51:40.796+00	Tape:12048->12049|R2:60->61|R1:54->55|
3c763805-1501-bb30-167d-7bee733b1d70	2021-03-05 17:52:45.515	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:52:45.427+00	2021-03-05 13:52:45.717+00	Tape:12049->12050|R2:61->62|R1:55->56|
d87cfe6e-d78b-e597-0069-c3e82b097f28	2021-03-05 18:20:32.729	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:20:32.638+00	2021-03-05 14:20:32.934+00	Tape:11921->11922|R2:76->77|R1:70->71|
2a724993-47d4-b400-33e9-f2f7222275bb	2021-03-05 17:54:45.946	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:54:45.945+00	2021-03-05 13:54:45.983+00	Tape:12050->12051|R2:62->63|R1:56->57|
80d75a7f-c8a4-b6f7-6c53-565ccc06c638	2021-03-05 17:56:46.943	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:56:46.942+00	2021-03-05 13:56:46.971+00	R2:63->64|R1:57->58|Tape:11908->11909|
447b66d0-5d69-92ae-c8ba-2982bd270e66	2021-03-05 18:22:55.103	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:22:55.035+00	2021-03-05 14:22:55.304+00	Tape:11922->11923|R2:77->78|R1:71->72|
e75bc54c-a75e-4ada-6217-e28456aa549b	2021-03-05 17:58:46.943	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:58:46.942+00	2021-03-05 13:58:46.974+00	Tape:11909->11910|R2:64->65|R1:58->59|
57f33031-7f7a-14b8-8584-a2a649bc014e	2021-03-05 17:59:35.748	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 13:59:35.683+00	2021-03-05 13:59:35.947+00	Tape:11910->11911|R2:65->66|R1:59->60|
2cc1ff9a-6168-2375-ada2-0ee400f66df2	2021-03-05 18:25:15.646	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:25:15.577+00	2021-03-05 14:25:15.847+00	Tape:11923->11924|R2:78->79|R1:72->73|
3a9b8346-a382-7b71-e9d8-9154cc23a321	2021-03-05 18:01:36.215	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:01:36.213+00	2021-03-05 14:01:36.253+00	Tape:11911->11912|R2:66->67|R1:60->61|
e5b2509c-e116-7a93-a816-dcb2280c8188	2021-03-05 18:03:37.211	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:03:37.21+00	2021-03-05 14:03:37.242+00	Tape:11912->11913|R2:67->68|R1:61->62|
aa2eb4c5-6d50-9f71-65e3-2d4383b14dc7	2021-03-05 18:26:19.904	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:26:19.843+00	2021-03-05 14:26:20.115+00	Tape:11924->11925|R2:79->80|R1:73->74|
aea9d21e-e2f3-123c-0516-bd21dace04b6	2021-03-05 18:05:37.211	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:05:37.21+00	2021-03-05 14:05:37.244+00	Tape:11913->11914|R2:68->69|R1:62->63|
e3988f1f-0c01-8e19-618e-d40c12c2a42d	2021-03-05 18:07:38.208	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:07:38.207+00	2021-03-05 14:07:38.24+00	Tape:11914->11915|R2:69->70|R1:63->64|
094b33a1-7721-aa7b-c859-30b1130ff4f6	2021-03-05 18:28:20.378	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:28:20.377+00	2021-03-05 14:28:20.415+00	Tape:11925->11926|R2:80->81|R1:74->75|
5886a883-d033-c21b-2d4a-00c3c964deb1	2021-03-05 18:09:39.206	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:09:39.205+00	2021-03-05 14:09:39.234+00	Tape:11915->11916|R2:70->71|R1:64->65|
7d234feb-8450-09df-e277-5c81d4c644af	2021-03-05 18:11:40.205	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:11:40.204+00	2021-03-05 14:11:40.24+00	Tape:11916->11917|R2:71->72|R1:65->66|
b0e98049-e47f-30ce-2a2f-2e447fd6aca8	2021-03-05 18:30:20.38	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:30:20.378+00	2021-03-05 14:30:20.416+00	Tape:11926->11927|R2:81->82|R1:75->76|
0185be7b-f123-91a9-ee1e-45446f48a41f	2021-03-05 18:13:40.212	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:13:40.211+00	2021-03-05 14:13:40.249+00	Tape:11917->11918|R2:72->73|R1:66->67|
c5a37854-113e-013f-ad95-34d0021e8cfe	2021-03-05 18:15:41.212	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:15:41.211+00	2021-03-05 14:15:41.244+00	Tape:11918->11919|R2:73->74|R1:67->68|
65b89996-9c2e-85f4-dae0-aacb633f0410	2021-03-05 18:32:21.38	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:32:21.379+00	2021-03-05 14:32:21.417+00	Tape:11927->11928|R2:82->83|R1:76->77|
aed19282-4de1-1d46-dda0-d83f4a33b757	2021-03-05 18:16:07.145	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:16:07.07+00	2021-03-05 14:16:07.339+00	Tape:11919->11920|R2:74->75|R1:68->69|
29348ef1-6eff-517b-4758-b9121f1470c1	2021-03-05 18:18:07.392	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:18:07.391+00	2021-03-05 14:18:07.43+00	Tape:11920->11921|R2:75->76|R1:69->70|
fd203bca-22c3-0893-776b-cb154dafe81d	2021-03-05 18:34:21.389	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:34:21.388+00	2021-03-05 14:34:21.421+00	Tape:11928->11929|R2:83->84|R1:77->78|
8b27c0e5-9846-6e97-957a-8b52d2ae0d27	2021-03-05 18:36:22.38	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:36:22.378+00	2021-03-05 14:36:22.409+00	Tape:11929->11930|R2:84->85|R1:78->79|
d54baecc-3382-30ea-8883-63e6fbf75ea0	2021-03-05 18:38:23.376	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:38:23.375+00	2021-03-05 14:38:23.409+00	Tape:11930->11931|R2:85->86|R1:79->80|
8f14e821-611b-4d35-04e8-ccc1037b58fc	2021-03-05 18:40:24.372	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:40:24.371+00	2021-03-05 14:40:24.403+00	Tape:11931->11932|R2:86->87|R1:80->81|
03e7caec-41d4-6887-95f3-462e3098ac32	2021-03-05 18:42:24.424	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:42:24.422+00	2021-03-05 14:42:24.451+00	Tape:11932->11933|R2:87->88|R1:81->82|
736ab45b-e54f-dbc0-2841-d400920c8f1e	2021-03-05 18:44:44.045	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:44:43.984+00	2021-03-05 14:44:44.214+00	Tape:11933->11934|R2:88->89|R1:82->83|
51fa42a1-b371-00ad-c128-441cfe75a95c	2021-03-05 18:46:44.504	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:46:44.503+00	2021-03-05 14:46:44.541+00	Tape:11934->11935|R1:83->84|R2:56->57|
2633029b-cc59-09e0-4ecb-0afa352d6d76	2021-03-05 18:48:45.502	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:48:45.5+00	2021-03-05 14:48:45.541+00	Tape:11935->11936|R2:57->58|R1:84->85|
3bba58f2-ea46-6c5a-cc28-c4d27c305b23	2021-03-05 18:50:45.501	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:50:45.5+00	2021-03-05 14:50:45.534+00	Tape:11936->11937|R2:58->59|R1:85->86|
87bbb9dd-1182-f310-4929-6915cda6a218	2021-03-05 18:52:45.508	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:52:45.506+00	2021-03-05 14:52:45.539+00	Tape:11937->11938|R2:59->60|R1:86->87|
320faee5-5ea7-bf85-7e07-e2e15a9c57fb	2021-03-05 18:54:45.508	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:54:45.507+00	2021-03-05 14:54:45.537+00	Tape:11938->11939|R2:60->61|R1:87->88|
6d4b9586-87fd-657d-ad1e-56a81ce05352	2021-03-05 18:56:46.506	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:56:46.505+00	2021-03-05 14:56:46.537+00	Tape:11939->11940|R2:61->62|R1:88->89|
ad500c69-4196-2976-0279-41f1f323cd69	2021-03-05 18:58:47.479	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 14:58:47.478+00	2021-03-05 14:58:47.508+00	Tape:11940->11941|R2:62->63|R1:89->90|
2e62d379-5b2f-d222-fb2c-bd9f0a2147b7	2021-03-05 19:24:42.458	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:24:42.393+00	2021-03-05 15:24:42.663+00	Tape:11941->11942|R2:63->64|R1:90->91|
e5c3925c-e6b2-0fb5-1604-6e14afeeadd1	2021-03-05 19:26:42.924	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:26:42.923+00	2021-03-05 15:26:42.964+00	Tape:11942->11943|R2:64->65|R1:91->92|
720a0cfd-22e7-9d7f-9817-ddc9a54d85cf	2021-03-05 19:28:42.964	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:28:42.961+00	2021-03-05 15:28:43.006+00	Tape:11943->11944|R2:65->66|R1:92->93|
41ac508f-4c39-90cc-4420-821143eb23bd	2021-03-05 19:30:42.966	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:30:42.964+00	2021-03-05 15:30:43.005+00	Tape:11944->11945|R2:66->67|R1:93->94|
fd2d152d-37eb-f9f9-5e34-b0394b2e7832	2021-03-05 19:32:42.967	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:32:42.966+00	2021-03-05 15:32:42.997+00	Tape:11945->11946|R2:67->68|R1:94->95|
198a8edc-0408-11c1-117e-0a25bf8f2ffa	2021-03-05 19:34:42.968	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:34:42.967+00	2021-03-05 15:34:43+00	Tape:11946->11947|R2:68->69|R1:95->96|
b092a8c5-1742-f3cc-19d4-33ab4409e1ab	2021-03-05 19:36:42.968	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:36:42.968+00	2021-03-05 15:36:42.998+00	Tape:11947->11948|R2:69->70|R1:96->97|
2792fb41-9592-662a-f932-a2ab43c7a5be	2021-03-05 19:38:42.97	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:38:42.969+00	2021-03-05 15:38:42.999+00	Tape:11948->11949|R2:70->71|R1:97->98|
3f2bea13-612a-86cb-50f5-3d8e6804eea7	2021-03-05 19:40:42.972	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:40:42.971+00	2021-03-05 15:40:43.002+00	Tape:11949->11950|R2:71->72|R1:98->99|
31c2e74d-e3df-dc5d-fb35-302acfbed73e	2021-03-05 19:42:43.971	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:42:43.97+00	2021-03-05 15:42:44.003+00	Tape:11950->11951|R2:72->73|R1:99->100|
ea732b46-f4bc-ec4c-2666-9809ebc0f33d	2021-03-05 19:44:44.97	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:44:44.969+00	2021-03-05 15:44:44.999+00	Tape:11951->11952|R2:73->74|R1:100->101|
b87a9e01-afc7-830d-5ea6-fa45e019ff93	2021-03-05 19:46:44.971	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:46:44.971+00	2021-03-05 15:46:45.004+00	Tape:11952->11953|R2:74->75|R1:101->102|
b74a0d80-2d4f-e9e3-e348-ee593b7409bb	2021-03-05 19:48:44.975	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:48:44.974+00	2021-03-05 15:48:45.007+00	Tape:11953->11954|R2:75->76|R1:102->103|
a48e9906-9b3a-fde9-b43d-908262203cd9	2021-03-05 19:50:45.974	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:50:45.973+00	2021-03-05 15:50:46.003+00	Tape:11954->11955|R2:76->77|R1:103->104|
eb0cb340-4042-bdc4-e18c-f4eb047aec3f	2021-03-05 19:52:45.976	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:52:45.975+00	2021-03-05 15:52:46.003+00	Tape:11955->11956|R2:77->78|R1:104->105|
f508e1df-e402-549d-63d4-2eb5fa2395d5	2021-03-05 19:54:46.972	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/app-core	2021-03-05 15:54:46.971+00	2021-03-05 15:54:47.008+00	Tape:11956->11957|R2:78->79|R1:105->106|
30658f05-a8f9-8fc1-241e-327eb44af41c	2021-03-11 21:55:58.35	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:55:58.34+00	2021-03-11 17:55:58.381+00	Tape:12040->12041|R2:160->161|R1:185->186|
907a4661-1d0d-b7cc-4462-a1bf2ae84449	2021-03-11 11:26:12.469	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:26:12.43+00	2021-03-11 07:26:12.544+00	Tape:11957->11958|R2:79->80|R1:106->107|
6788f98c-d942-db88-38c2-41253f9f63d8	2021-03-11 11:39:09.848	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:39:09.809+00	2021-03-11 07:39:09.919+00	Tape:11958->11959|R2:80->81|R1:107->108|
9e3b5db0-d7a7-09bb-1bcf-536d47ea9fe0	2021-03-11 11:41:47.032	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:41:46.992+00	2021-03-11 07:41:47.099+00	Tape:11959->11960|R2:81->82|R1:108->109|
38b23e55-3220-a041-c5a7-dcf1aa93a626	2021-03-11 11:43:47.976	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:43:47.965+00	2021-03-11 07:43:48.011+00	Tape:11960->11961|R2:82->83|R1:109->110|
7e5ae0b4-7179-6e72-2fa3-a2dffb26b929	2021-03-11 11:45:48.97	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:45:48.962+00	2021-03-11 07:45:48.999+00	Tape:11961->11962|R2:83->84|R1:110->111|
681e9441-9d51-2cbf-80de-cafbbfca2368	2021-03-11 11:47:48.972	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:47:48.963+00	2021-03-11 07:47:49.002+00	Tape:11962->11963|R2:84->85|R1:111->112|
71768fd5-607f-a890-5dc5-eab30f2b0809	2021-03-11 11:49:49.969	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:49:49.96+00	2021-03-11 07:49:50+00	Tape:11963->11964|R2:85->86|R1:112->113|
25fc5ebe-38d4-8902-1746-c455deb76029	2021-03-11 11:51:50.965	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:51:50.956+00	2021-03-11 07:51:50.994+00	Tape:11964->11965|R2:86->87|R1:113->114|
af01e7f3-bee8-c5e2-08b0-b08eb3fe89c3	2021-03-11 11:53:51.962	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:53:51.955+00	2021-03-11 07:53:51.985+00	Tape:11965->11966|R2:87->88|R1:114->115|
9e651ef1-947f-293b-ce88-78488d6ac68f	2021-03-11 11:55:52.924	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:55:52.917+00	2021-03-11 07:55:52.95+00	Tape:11966->11967|R2:88->89|R1:115->116|
816f5fe0-c888-e685-0884-4cd4abfd2bcd	2021-03-11 11:57:53.921	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:57:53.913+00	2021-03-11 07:57:53.946+00	Tape:11967->11968|R2:89->90|R1:116->117|
4c1fd393-b072-e7e3-9d97-135600acc8b4	2021-03-11 11:59:54.915	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 07:59:54.908+00	2021-03-11 07:59:54.947+00	Tape:11968->11969|R2:90->91|R1:117->118|
34b5df2d-f6f0-d028-0d05-841507808675	2021-03-11 12:01:55.915	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 08:01:55.908+00	2021-03-11 08:01:55.939+00	Tape:11969->11970|R2:91->92|R1:118->119|
8d25b4f5-fbaf-9aa6-2b76-4362281ffb56	2021-03-11 12:03:56.91	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 08:03:56.904+00	2021-03-11 08:03:56.934+00	Tape:11970->11971|R2:92->93|R1:119->120|
a2e5b97c-798a-7c12-19e1-aa4e8ac2013e	2021-03-11 12:05:57.907	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 08:05:57.899+00	2021-03-11 08:05:57.932+00	Tape:11971->11972|R2:93->94|R1:120->121|
9c3b091d-63e3-2d36-5827-746328548335	2021-03-11 12:07:58.903	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 08:07:58.896+00	2021-03-11 08:07:58.93+00	Tape:11972->11973|R2:94->95|R1:121->122|
9947f71d-cc77-07a1-ad7b-104ea4f92f7a	2021-03-11 12:09:59.9	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 08:09:59.891+00	2021-03-11 08:09:59.924+00	Tape:11973->11974|R2:95->96|R1:122->123|
81a6d2fb-28ca-7fc2-21e0-56dfcebb0c0e	2021-03-11 12:13:47.332	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 08:13:47.282+00	2021-03-11 08:13:47.414+00	Tape:11974->11975|R2:96->97|R1:123->124|
c517e281-e308-1200-fced-0859c7ff348a	2021-03-11 12:15:48.259	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 08:15:48.249+00	2021-03-11 08:15:48.296+00	Tape:11975->11976|R2:97->98|R1:124->125|
b7ea8e64-c05b-dd8c-ec2b-c0bda23a4b35	2021-03-11 12:19:32.136	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 08:17:53.707+00	2021-03-11 08:19:33.089+00	Tape:11976->11977|R2:98->99|R1:125->126|
25cc178e-444b-0558-6fab-3497e28968d6	2021-03-11 13:16:00.281	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 09:15:59.984+00	2021-03-11 09:16:00.831+00	Tape:11977->11978|R2:99->100|R1:126->127|
7c142e26-7275-69eb-b8be-7c2f47ae980e	2021-03-11 15:20:03.182	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:20:03.141+00	2021-03-11 11:20:03.257+00	Tape:11978->11979|R2:100->101|R1:127->128|
699628e8-0916-cf04-0e09-b3f2724b46bc	2021-03-11 15:22:04.129	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:22:04.117+00	2021-03-11 11:22:04.176+00	Tape:11979->11980|R2:101->102|R1:128->129|
e1e61fab-ca23-1169-9bc3-f80659c4a2ef	2021-03-11 15:24:05.129	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:24:05.115+00	2021-03-11 11:24:05.165+00	Tape:11980->11981|R2:102->103|R1:129->130|
2fb1c23d-de9f-d50d-7b32-2cb41fc15fd8	2021-03-11 15:26:05.128	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:26:05.118+00	2021-03-11 11:26:05.163+00	Tape:11981->11982|R2:103->104|R1:130->131|
efb5b336-bdc8-7b19-318d-ecd147c1432d	2021-03-11 15:28:05.129	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:28:05.119+00	2021-03-11 11:28:05.163+00	Tape:11982->11983|R2:104->105|R1:131->132|
005da90b-271c-854f-0e46-270b30cb05c5	2021-03-11 15:30:05.134	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:30:05.123+00	2021-03-11 11:30:05.167+00	Tape:11983->11984|R2:105->106|R1:132->133|
81145e98-16c2-4ddc-d689-03a4ebb289eb	2021-03-11 15:32:05.135	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:32:05.124+00	2021-03-11 11:32:05.165+00	Tape:11984->11985|R2:106->107|R1:133->134|
d443978f-16ed-b1db-d260-db94d8fc96bd	2021-03-11 15:34:05.133	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:34:05.125+00	2021-03-11 11:34:05.163+00	Tape:11985->11986|R2:107->108|R1:134->135|
2b8ce410-9851-8d7b-24cb-07756da1555d	2021-03-11 15:36:05.143	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:36:05.134+00	2021-03-11 11:36:05.173+00	Tape:11986->11987|R2:108->109|R1:135->136|
e4ba1099-597f-ceee-b58d-e74b520c244d	2021-03-11 15:38:05.154	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:38:05.145+00	2021-03-11 11:38:05.183+00	Tape:11987->11988|R2:109->110|R1:136->137|
4feb49f2-cc44-9764-f356-564a0f350666	2021-03-11 15:40:05.155	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:40:05.145+00	2021-03-11 11:40:05.188+00	Tape:11988->11989|R2:110->111|R1:137->138|
9a2cbf9b-ba68-dc9e-4831-aa225f462667	2021-03-11 15:42:05.156	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:42:05.147+00	2021-03-11 11:42:05.185+00	Tape:11989->11990|R2:111->112|R1:138->139|
0232109e-7c78-f051-964d-3560955f7103	2021-03-11 15:44:05.161	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:44:05.152+00	2021-03-11 11:44:05.191+00	Tape:11990->11991|R2:112->113|R1:139->140|
f8142cc0-1e29-8eee-9c85-70668205f034	2021-03-11 15:46:06.16	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:46:06.152+00	2021-03-11 11:46:06.191+00	Tape:11991->11992|R2:113->114|R1:140->141|
22de8f1a-7a0a-047d-8611-e58db228ae80	2021-03-11 15:48:06.162	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:48:06.153+00	2021-03-11 11:48:06.188+00	Tape:11992->11993|R2:114->115|R1:141->142|
c48741b6-cd48-7226-889d-28b788205400	2021-03-11 15:50:06.169	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:50:06.158+00	2021-03-11 11:50:06.205+00	Tape:11993->11994|R2:115->116|R1:142->143|
cba639f1-c16a-d289-f86a-4b6afcf6e4d2	2021-03-11 15:52:07.166	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:52:07.156+00	2021-03-11 11:52:07.196+00	Tape:11994->11995|R2:116->117|R1:143->144|
04489fcc-5baf-8ac3-335e-7ac75e79d3d1	2021-03-11 15:54:07.169	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:54:07.16+00	2021-03-11 11:54:07.199+00	Tape:11995->11996|R2:117->118|R1:144->145|
d46edb5e-9863-4752-5dbc-610455298130	2021-03-11 15:56:07.17	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:56:07.161+00	2021-03-11 11:56:07.2+00	Tape:11996->11997|R2:118->119|R1:145->146|
5abd0a8e-92bf-881c-f754-956ace48f424	2021-03-11 15:58:08.15	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 11:58:08.14+00	2021-03-11 11:58:08.179+00	Tape:11997->11998|R2:119->120|R1:146->147|
b1be80bc-dd50-753e-2a31-f582139f8894	2021-03-11 16:00:08.151	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:00:08.143+00	2021-03-11 12:00:08.182+00	Tape:11998->11999|R2:120->121|R1:147->148|
9781dc4a-dcbc-28a2-f922-f3496c1196bd	2021-03-11 16:02:09.153	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:02:09.141+00	2021-03-11 12:02:09.186+00	Tape:11999->12000|R2:121->122|R1:148->149|
574e99b0-57bd-c1f2-92eb-941938e2da93	2021-03-11 16:04:09.151	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:04:09.141+00	2021-03-11 12:04:09.185+00	Tape:12000->12001|R2:122->123|R1:149->150|
fa92f792-9876-961f-3887-0036150fb087	2021-03-11 16:06:10.151	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:06:10.143+00	2021-03-11 12:06:10.182+00	Tape:12001->12002|R2:123->124|R1:150->151|
62c2153e-7eb5-3836-e813-c085553d6930	2021-03-11 16:08:10.152	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:08:10.143+00	2021-03-11 12:08:10.186+00	Tape:12002->12003|R2:124->125|R1:151->152|
dc971ef9-25dd-5d2e-7cfd-d9f743b40576	2021-03-11 21:57:58.35	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:57:58.34+00	2021-03-11 17:57:58.385+00	Tape:12041->12042|R2:161->162|R1:186->187|
6d06291c-2155-c7a2-b593-ed60b482833c	2021-03-11 16:10:10.155	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:10:10.147+00	2021-03-11 12:10:10.188+00	Tape:12003->12004|R2:125->126|R1:152->153|
5b0d574c-348e-32fd-f9fd-2fb22d7f1b4b	2021-03-11 16:12:11.155	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:12:11.147+00	2021-03-11 12:12:11.183+00	Tape:12004->12005|R2:126->127|R1:153->154|
196c5c37-e0ba-5d15-01e3-b73d81cbe855	2021-03-11 21:59:59.348	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:59:59.339+00	2021-03-11 17:59:59.381+00	Tape:12042->12043|R2:162->163|R1:187->188|
a9d6e1c1-461c-f501-2599-85df2fd73315	2021-03-11 16:14:12.108	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:14:12.101+00	2021-03-11 12:14:12.137+00	Tape:12005->12006|R2:127->128|R1:154->155|
022e432a-4ebc-d305-6f74-c123215ddf48	2021-03-11 16:16:13.107	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:16:13.099+00	2021-03-11 12:16:13.136+00	Tape:12006->12007|R2:128->129|R1:155->156|
40190543-400f-342c-a4bf-b288fde9d785	2021-03-11 22:01:59.351	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 18:01:59.341+00	2021-03-11 18:01:59.383+00	Tape:12043->12044|R2:163->164|R1:188->189|
a15b42ed-5841-7418-ac27-0f7a5b0f0b76	2021-03-11 16:18:13.106	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:18:13.099+00	2021-03-11 12:18:13.136+00	Tape:12007->12008|R2:129->130|R1:156->157|
c26d40fe-5acf-0ebb-80c7-6cbe0dd8ff1c	2021-03-11 16:20:14.106	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:20:14.097+00	2021-03-11 12:20:14.137+00	Tape:12008->12009|R2:130->131|R1:157->158|
957fe759-5ea0-e45b-4933-50e419069139	2021-03-11 22:04:00.348	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 18:04:00.339+00	2021-03-11 18:04:00.379+00	Tape:12044->12045|R2:164->165|R1:189->190|
64723206-0962-1b3c-c02b-05a035b503e8	2021-03-11 16:22:15.103	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:22:15.096+00	2021-03-11 12:22:15.133+00	Tape:12009->12010|R2:131->132|R1:158->159|
15beae6b-1dcc-73bc-8b41-5bae04cd6e1e	2021-03-11 16:24:15.108	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:24:15.1+00	2021-03-11 12:24:15.137+00	Tape:12010->12011|R2:132->133|R1:159->160|
76c90425-2cfd-6aa6-e6e5-3ec9070401af	2021-03-11 22:06:01.348	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 18:06:01.337+00	2021-03-11 18:06:01.379+00	Tape:12045->12046|R2:165->166|R1:190->191|
e88bd01b-9e5a-77f1-3d48-e8a3c67492d2	2021-03-11 16:26:16.104	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:26:16.096+00	2021-03-11 12:26:16.133+00	Tape:12011->12012|R2:133->134|R1:160->161|
030041c6-d6c9-fa49-9d23-bc0c3e1e6c55	2021-03-11 16:28:16.128	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:28:16.12+00	2021-03-11 12:28:16.155+00	Tape:12012->12013|R2:134->135|R1:161->162|
225135dc-0f8f-25c0-5cea-c89b5c0040f8	2021-03-11 22:08:02.347	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 18:08:02.337+00	2021-03-11 18:08:02.379+00	Tape:12046->12047|R2:166->167|R1:191->192|
a4c9e696-fdae-e696-af41-eec8f6b4c3b6	2021-03-11 16:30:16.137	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:30:16.128+00	2021-03-11 12:30:16.166+00	Tape:12013->12014|R2:135->136|R1:162->163|
6c9a2afe-c276-3394-c115-6aa47805a8c0	2021-03-11 16:32:16.138	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:32:16.128+00	2021-03-11 12:32:16.167+00	Tape:12014->12015|R2:136->137|R1:163->164|
f4f3869b-d1be-b5b9-8819-768ce3bcee6f	2021-03-11 22:16:36.228	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 18:16:36.187+00	2021-03-11 18:16:36.299+00	Tape:12047->12048|R2:167->168|R1:192->193|
8deff094-27f1-26bb-19f9-b039b64324b1	2021-03-11 16:34:17.139	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:34:17.129+00	2021-03-11 12:34:17.169+00	Tape:12015->12016|R2:137->138|R1:164->165|
c8565b91-e0bb-6808-5a8d-644e9015e1b3	2021-03-11 16:36:18.133	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 12:36:18.125+00	2021-03-11 12:36:18.164+00	Tape:12016->12017|R2:138->139|R1:165->166|
3dd2550a-9f1f-3432-4baa-d456d17b122e	2021-03-11 20:51:48.193	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 16:51:42.41+00	2021-03-11 16:51:48.597+00	Tape:12017->12018|R2:139->140|R1:166->167|
9aab42a0-0a65-2479-0d7f-dbe3bd4c697b	2021-03-11 20:53:43.486	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 16:53:43.378+00	2021-03-11 16:53:43.816+00	Tape:12018->12019|R2:140->141|R1:167->168|
953ccc8c-1788-dc9b-b2d5-75188d35ac63	2021-03-11 20:55:44.484	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 16:55:44.376+00	2021-03-11 16:55:44.838+00	Tape:12019->12020|R2:141->142|R1:168->169|
b8f6f1c8-f3da-90cb-a081-40a3943694ec	2021-03-11 20:57:44.497	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 16:57:44.377+00	2021-03-11 16:57:44.847+00	Tape:12020->12021|R2:142->143|R1:169->170|
f7d625ab-35cb-91ba-de35-defb14b9bd21	2021-03-11 20:59:45.484	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 16:59:45.375+00	2021-03-11 16:59:45.783+00	Tape:12021->12022|R2:143->144|R1:170->171|
b6c98c45-96ec-fe0e-b311-53ae0a2c67f9	2021-03-11 21:02:01.752	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:02:01.71+00	2021-03-11 17:02:01.826+00	Tape:12022->12023|R2:144->145|R1:171->172|
d19af49a-3f19-2795-459e-5b915cf35226	2021-03-11 21:04:02.691	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:04:02.68+00	2021-03-11 17:04:02.729+00	Tape:12023->12024|R2:143->144|R1:168->169|
4693677f-bd70-7a04-19b3-7f02258bf606	2021-03-11 21:06:02.691	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:06:02.681+00	2021-03-11 17:06:02.728+00	Tape:12024->12025|R2:144->145|R1:169->170|
d1183d8b-c095-971a-c426-f3586443a57d	2021-03-11 21:08:03.69	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:08:03.68+00	2021-03-11 17:08:03.724+00	Tape:12025->12026|R2:145->146|R1:170->171|
68eb4bd2-c148-f30e-3bbd-ae9de2fc7c87	2021-03-11 21:10:03.692	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:10:03.683+00	2021-03-11 17:10:03.723+00	Tape:12026->12027|R2:146->147|R1:171->172|
86f66ca6-2286-7f53-2f40-07b03e541278	2021-03-11 21:12:03.698	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:12:03.687+00	2021-03-11 17:12:03.729+00	Tape:12027->12028|R2:147->148|R1:172->173|
e7ef565c-8a08-38be-483b-7b1ec547e263	2021-03-11 21:14:04.696	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:14:04.687+00	2021-03-11 17:14:04.726+00	Tape:12028->12029|R2:148->149|R1:173->174|
b0f94624-2ac4-47f0-34e0-28b6f530ef28	2021-03-11 21:16:05.691	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:16:05.682+00	2021-03-11 17:16:05.719+00	Tape:12029->12030|R2:149->150|R1:174->175|
ecb3d203-f68a-7137-5cb6-8917289a9bad	2021-03-11 21:18:05.691	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:18:05.682+00	2021-03-11 17:18:05.722+00	Tape:12030->12031|R2:150->151|R1:175->176|
f657da83-056f-a81b-8236-e34b3b9dc113	2021-03-11 21:20:05.691	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:20:05.682+00	2021-03-11 17:20:05.72+00	Tape:12031->12032|R2:151->152|R1:176->177|
a48d849f-59be-cb83-74c5-5d0cd0b82abd	2021-03-11 21:22:05.691	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:22:05.683+00	2021-03-11 17:22:05.719+00	Tape:12032->12033|R2:152->153|R1:177->178|
e2486b41-1923-db58-2db5-73b35961578a	2021-03-11 21:29:50.079	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:29:50.037+00	2021-03-11 17:29:50.154+00	Tape:12033->12034|R2:153->154|R1:178->179|
ca324a91-423b-b72c-5078-7e6471bfa49d	2021-03-11 21:31:51.02	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:31:51.008+00	2021-03-11 17:31:51.063+00	Tape:12034->12035|R2:154->155|R1:179->180|
9cbf14f7-e2f4-0f7c-cf25-ab364a9ecea1	2021-03-11 21:33:51.019	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:33:51.008+00	2021-03-11 17:33:51.055+00	Tape:12035->12036|R2:155->156|R1:180->181|
8facb29f-77d0-08c3-3465-e6b080028047	2021-03-11 21:35:00.158	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:35:00.116+00	2021-03-11 17:35:00.23+00	Tape:12036->12037|R2:156->157|R1:181->182|
67dfd026-5e75-51e4-9189-a7c29f2e6069	2021-03-11 21:49:56.397	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:49:56.355+00	2021-03-11 17:49:56.473+00	Tape:12037->12038|R2:157->158|R1:182->183|
65b59613-1a22-2615-957f-35068922a848	2021-03-11 21:51:57.342	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:51:57.328+00	2021-03-11 17:51:57.379+00	Tape:12038->12039|R2:158->159|R1:183->184|
5a54f293-2593-2d36-a4de-a9924cc7db98	2021-03-11 21:53:58.337	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 17:53:58.326+00	2021-03-11 17:53:58.374+00	Tape:12039->12040|R2:159->160|R1:184->185|
2ce1a9e9-bb57-2769-76c5-87357bb199e2	2021-03-11 22:18:37.175	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 18:18:37.163+00	2021-03-11 18:18:37.213+00	Tape:12048->12049|R2:168->169|R1:193->194|
babf4619-3d99-8a9c-710c-3809b6f87f85	2021-03-11 22:20:38.171	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 18:20:38.159+00	2021-03-11 18:20:38.206+00	Tape:12049->12050|R2:169->170|R1:194->195|
6b85fd93-20d3-cbb7-8e7f-fc9fe3de35c3	2021-03-11 22:22:39.167	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-11 18:22:39.158+00	2021-03-11 18:22:39.199+00	Tape:12050->12051|R2:170->171|R1:195->196|
ff04f453-a24b-16d7-6b03-924c2a13c1b6	2021-03-12 11:36:29.019	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:36:28.976+00	2021-03-12 07:36:29.1+00	Tape:12051->12052|R2:171->172|R1:196->197|
490227ec-e553-a72e-153d-4d69f80354d0	2021-03-12 11:38:29.956	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:38:29.944+00	2021-03-12 07:38:29.996+00	Tape:12052->12053|R2:172->173|R1:197->198|
fc875620-6046-c1ed-6c93-05afc2f8dfc9	2021-03-12 11:40:30.948	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:40:30.937+00	2021-03-12 07:40:30.983+00	Tape:12053->12054|R2:173->174|R1:198->199|
60001b2f-b460-fbda-4e46-2bc6040ddc55	2021-03-12 11:46:13.726	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:46:13.684+00	2021-03-12 07:46:13.795+00	Tape:12054->12055|R2:174->175|R1:199->200|
aac6743f-fa7c-7971-386a-eac402be3512	2021-03-12 11:48:14.666	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:48:14.655+00	2021-03-12 07:48:14.703+00	Tape:12055->12056|R2:175->176|R1:200->201|
87fd60ad-c85d-c75b-aff1-b720f862ee7e	2021-03-12 11:50:15.662	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:50:15.651+00	2021-03-12 07:50:15.697+00	Tape:12056->12057|R2:176->177|R1:201->202|
d40b4b1a-7e3c-acf4-df43-87f7ee6ecab1	2021-03-12 11:52:16.654	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:52:16.644+00	2021-03-12 07:52:16.687+00	Tape:12057->12058|R2:177->178|R1:202->203|
7345ee99-4a75-78de-90a8-a49faa174ca1	2021-03-12 11:54:17.651	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:54:17.64+00	2021-03-12 07:54:17.683+00	Tape:12058->12059|R2:178->179|R1:203->204|
29c50a36-46f1-d3fa-5c82-7ee52097895b	2021-03-12 11:56:17.652	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:56:17.643+00	2021-03-12 07:56:17.686+00	Tape:12059->12060|R2:179->180|R1:204->205|
eab10563-31ad-51f0-204a-2c80b3bddde8	2021-03-12 11:57:46.892	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 07:57:46.612+00	2021-03-12 07:57:47.275+00	Tape:12060->12061|R2:180->181|R1:205->206|
fb92b823-b4ac-88b6-ab4c-aecf78bc99ab	2021-03-12 16:45:16.584	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 12:45:16.337+00	2021-03-12 12:45:16.927+00	Tape:12061->12062|R2:181->182|R1:206->207|
39355cbf-0ffd-8b57-5ef2-575baca533fd	2021-03-12 16:47:25.714	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 12:47:25.586+00	2021-03-12 12:47:26.083+00	Tape:12062->12063|R2:182->183|R1:207->208|
9f2c2b45-cb45-a2e7-3dec-c6b3a165e806	2021-03-12 17:23:21.234	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:23:20.869+00	2021-03-12 13:23:21.619+00	Tape:12063->12064|R2:183->184|R1:208->209|
35678059-0ea9-ce88-5a1f-96323800587a	2021-03-12 17:25:21.391	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:25:21.289+00	2021-03-12 13:25:21.685+00	Tape:12064->12065|R2:184->185|R1:209->210|
b9f9d39b-43bf-6453-f3bc-0d68e38ead9d	2021-03-12 17:27:22.395	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:27:22.289+00	2021-03-12 13:27:22.69+00	Tape:12065->12066|R2:185->186|R1:210->211|
d9fdff07-7c7e-e434-a673-3f5e4a8d40ec	2021-03-12 17:29:22.393	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:29:22.289+00	2021-03-12 13:29:22.684+00	Tape:12066->12067|R2:186->187|R1:211->212|
89bbde9f-7dfd-a52d-c93f-aefbeb091ee3	2021-03-12 17:31:23.399	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:31:23.283+00	2021-03-12 13:31:23.689+00	Tape:12067->12068|R2:187->188|R1:212->213|
5b508c7f-7641-da73-bf08-fd79c3af4358	2021-03-12 17:33:23.392	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:33:23.29+00	2021-03-12 13:33:23.685+00	Tape:12068->12069|R2:188->189|R1:213->214|
ee37b7a0-96e4-06ef-394a-6ab0f3c3acbc	2021-03-12 17:35:24.18	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:35:23.306+00	2021-03-12 13:35:27.728+00	Tape:12069->12070|R2:189->190|R1:214->215|
30a75f1d-5cab-84e1-b680-4de9d8870a5d	2021-03-12 17:37:23.483	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:37:23.306+00	2021-03-12 13:37:23.783+00	Tape:12070->12071|R2:190->191|R1:215->216|
fcb5f7dd-fa98-7ad4-390b-4459d190b8dd	2021-03-12 17:39:25.28	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:39:24.305+00	2021-03-12 13:39:28.329+00	Tape:12071->12072|R2:191->192|R1:216->217|
af5494e8-cb7e-aa26-41fa-4dc609865212	2021-03-12 17:41:26.283	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:41:25.304+00	2021-03-12 13:41:29.376+00	Tape:12072->12073|R2:192->193|R1:217->218|
e7380e14-baa5-dd56-a42f-0d071e0c8389	2021-03-12 17:43:26.312	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:43:26.303+00	2021-03-12 13:43:26.346+00	Tape:12073->12074|R2:193->194|R1:218->219|
1befb28c-e658-0d4d-ed2f-2df96172de96	2021-03-12 17:45:27.309	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:45:27.3+00	2021-03-12 13:45:27.34+00	Tape:12074->12075|R2:194->195|R1:219->220|
35c8fbf1-c59b-bc0f-2647-2fbbe58e6e76	2021-03-12 17:47:27.313	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:47:27.305+00	2021-03-12 13:47:27.344+00	Tape:12075->12076|R2:195->196|R1:220->221|
0ccdcbbc-4539-ae6f-de93-ae1e64ce9815	2021-03-12 17:49:28.311	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:49:28.303+00	2021-03-12 13:49:28.341+00	Tape:12076->12077|R2:196->197|R1:221->222|
b4a5070b-224d-9799-f969-b5ec40a655de	2021-03-12 17:51:28.318	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:51:28.309+00	2021-03-12 13:51:28.345+00	Tape:12077->12078|R2:197->198|R1:222->223|
e06e6130-d5c6-902c-c5ef-16b8e571e6f3	2021-03-12 17:53:29.318	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:53:29.304+00	2021-03-12 13:53:29.352+00	Tape:12078->12079|R2:198->199|R1:223->224|
9e9468f0-17e8-caf4-28b4-c261d6420cd4	2021-03-12 17:55:30.312	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:55:30.303+00	2021-03-12 13:55:30.343+00	Tape:12079->12080|R2:199->200|R1:224->225|
0bdae2b4-6731-8fc8-48b7-5f7f75cf3a5e	2021-03-12 17:57:31.285	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:57:31.276+00	2021-03-12 13:57:31.321+00	Tape:12080->12081|R2:200->201|R1:225->226|
25394054-f14f-f243-9e38-e8b43c350f67	2021-03-12 17:59:31.285	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 13:59:31.277+00	2021-03-12 13:59:31.312+00	Tape:12081->12082|R2:201->202|R1:226->227|
1dda95de-3ba5-b897-0649-e165c57c858b	2021-03-12 18:01:32.286	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:01:32.276+00	2021-03-12 14:01:32.318+00	Tape:12082->12083|R2:202->203|R1:227->228|
89358c73-ff18-564d-5781-8b910fd87cc8	2021-03-12 18:03:32.284	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:03:32.276+00	2021-03-12 14:03:32.316+00	Tape:12083->12084|R2:203->204|R1:228->229|
76433586-9e1e-1a60-65f4-191c8a0b2de0	2021-03-12 18:05:33.287	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:05:33.278+00	2021-03-12 14:05:33.319+00	Tape:12084->12085|R2:204->205|R1:229->230|
fd413823-019d-e5f2-9a4d-7488be8429c6	2021-03-12 18:07:34.279	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:07:34.27+00	2021-03-12 14:07:34.312+00	Tape:12085->12086|R2:205->206|R1:230->231|
26f02479-b02f-b395-9bc3-20acc3e58529	2021-03-12 18:09:34.279	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:09:34.271+00	2021-03-12 14:09:34.306+00	Tape:12086->12087|R2:206->207|R1:231->232|
3bf4d07f-a2fe-0511-1a62-6532186f69b7	2021-03-12 18:11:35.275	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:11:35.266+00	2021-03-12 14:11:35.306+00	Tape:12087->12088|R2:207->208|R1:232->233|
d3fd5d24-6557-3494-f512-5f4231a0bb10	2021-03-12 18:13:35.275	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:13:35.266+00	2021-03-12 14:13:35.305+00	Tape:12088->12089|R2:208->209|R1:233->234|
28a40c31-02dd-254a-25cd-bf944e7f2883	2021-03-12 18:15:35.279	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:15:35.27+00	2021-03-12 14:15:35.309+00	Tape:12089->12090|R2:209->210|R1:234->235|
2b8a44a0-98cc-b01e-a822-d7aa6af86aa9	2021-03-12 18:17:36.268	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:17:36.26+00	2021-03-12 14:17:36.296+00	Tape:12090->12091|R2:210->211|R1:235->236|
a791408e-fff2-aef4-96e4-2da43cef268d	2021-03-12 18:19:36.268	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:19:36.26+00	2021-03-12 14:19:36.298+00	Tape:12091->12092|R2:211->212|R1:236->237|
f5cd26be-34a7-bbcd-1f52-6e8551f66144	2021-03-12 18:21:37.266	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:21:37.257+00	2021-03-12 14:21:37.296+00	Tape:12092->12093|R2:212->213|R1:237->238|
ba5482eb-9a6f-188d-1f87-6bbc7eda97d4	2021-03-12 18:23:37.271	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:23:37.261+00	2021-03-12 14:23:37.304+00	Tape:12093->12094|R2:213->214|R1:238->239|
623b4714-c3cc-2284-b0a0-764cb4053424	2021-03-12 18:25:38.261	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:25:38.251+00	2021-03-12 14:25:38.293+00	Tape:12094->12095|R2:214->215|R1:239->240|
f1f191b9-aa9d-827e-5214-eb43fad03c20	2021-03-12 18:27:38.264	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:27:38.254+00	2021-03-12 14:27:38.296+00	Tape:12095->12096|R2:215->216|R1:240->241|
fff38e69-e04e-e3d6-30ec-55238a6b4c07	2021-03-12 18:29:38.289	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:29:38.281+00	2021-03-12 14:29:38.318+00	Tape:12096->12097|R2:216->217|R1:241->242|
71a841d1-628f-3919-3cc2-fa20dc847d93	2021-03-12 18:31:39.286	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:31:39.278+00	2021-03-12 14:31:39.316+00	Tape:12097->12098|R2:217->218|R1:242->243|
e080de02-27ec-fdee-eedb-175a6d0b1c69	2021-03-12 18:33:40.283	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 14:33:40.275+00	2021-03-12 14:33:40.311+00	Tape:12098->12099|R2:218->219|R1:243->244|
a848b52e-0bf4-25e0-ea5c-8cac67e41db2	2021-03-12 19:05:06.405	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 15:05:06.392+00	2021-03-12 15:05:06.76+00	Tape:12099->12100|R2:219->220|R1:244->245|
4d8abcc6-49eb-da63-16b1-911f86b875d2	2021-03-12 19:07:06.939	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 15:07:06.824+00	2021-03-12 15:07:07.236+00	Tape:12100->12101|R2:220->221|R1:245->246|
67cf8360-9578-f181-b1f7-647c0baea784	2021-03-12 19:09:06.928	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 15:09:06.83+00	2021-03-12 15:09:07.22+00	Tape:12101->12102|R2:221->222|R1:246->247|
a6a18347-6231-d144-2c24-7c1ef9eec66e	2021-03-12 19:10:58.803	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 15:10:58.472+00	2021-03-12 15:10:59.145+00	Tape:12102->12103|R2:222->223|R1:247->248|
895f9f97-61e5-a1e0-9238-9cc361bcccc9	2021-03-12 19:12:59.24	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 15:12:59.136+00	2021-03-12 15:12:59.533+00	Tape:12103->12104|R2:223->224|R1:248->249|
725ef609-bf5a-5572-c8a7-8d2ae75b6e2f	2021-03-12 19:14:59.238	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 15:14:59.137+00	2021-03-12 15:14:59.526+00	Tape:12104->12105|R2:224->225|R1:249->250|
d5bdd20b-54b2-717b-ff64-cfd56993d5b7	2021-03-12 19:16:59.244	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 15:16:59.139+00	2021-03-12 15:16:59.53+00	Tape:12105->12106|R2:225->226|R1:250->251|
d118b633-ecee-33d3-4f56-db875c94927b	2021-03-12 19:18:59.243	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 15:18:59.14+00	2021-03-12 15:18:59.529+00	Tape:12106->12107|R2:226->227|R1:251->252|
e5986682-3b89-c8b0-4c4b-38dc9afe076d	2021-03-12 22:07:52.49	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-12 18:07:52.16+00	2021-03-12 18:07:52.868+00	Tape:12107->12108|R2:227->228|R1:252->253|
bdd08f9e-67bf-e534-8d93-998ddff03d06	2021-03-14 19:13:49.93	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:13:49.693+00	2021-03-14 15:13:50.023+00	Tape:12108->12109|R2:228->229|R1:253->254|
933994d4-8769-a981-9690-f476fa5e17bb	2021-03-14 19:15:50.355	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:15:50.33+00	2021-03-14 15:15:50.396+00	Tape:12109->12110|R2:229->230|R1:254->255|
08deb41b-b4a1-49b7-4173-98ad8c6e7bf0	2021-03-14 19:17:51.339	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:17:51.328+00	2021-03-14 15:17:51.374+00	Tape:12110->12111|R2:230->231|R1:255->256|
8c5c6704-e1ec-5bca-e595-0dd86fd5a5ee	2021-03-14 19:19:52.332	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:19:52.323+00	2021-03-14 15:19:52.362+00	Tape:12111->12112|R2:231->232|R1:256->257|
31ec0d56-f3ad-c9f9-c0c3-d4edee6bed38	2021-03-14 19:21:52.337	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:21:52.328+00	2021-03-14 15:21:52.366+00	Tape:12112->12113|R2:232->233|R1:257->258|
3ac02c78-984c-1426-6bd2-0288b4f0d1b4	2021-03-14 19:23:52.337	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:23:52.328+00	2021-03-14 15:23:52.366+00	Tape:12113->12114|R2:233->234|R1:258->259|
3629322c-028b-f1f4-1257-075f28453858	2021-03-14 19:25:53.335	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:25:53.327+00	2021-03-14 15:25:53.364+00	Tape:12114->12115|R2:234->235|R1:259->260|
c0abacf4-0c1c-e260-80e1-68cb58766504	2021-03-14 19:27:53.337	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:27:53.327+00	2021-03-14 15:27:53.37+00	Tape:12115->12116|R2:235->236|R1:260->261|
c9476a49-4bfb-19ca-34bd-6ed27e8f7634	2021-03-14 19:29:53.336	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:29:53.328+00	2021-03-14 15:29:53.366+00	Tape:12116->12117|R2:236->237|R1:261->262|
5c3dd71f-e443-2413-14fc-36b2ec73abf1	2021-03-14 19:31:54.333	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:31:54.324+00	2021-03-14 15:31:54.363+00	Tape:12117->12118|R2:237->238|R1:262->263|
4a1490da-6b03-7727-db6a-f083daa9b7cd	2021-03-14 19:33:54.332	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:33:54.324+00	2021-03-14 15:33:54.362+00	Tape:12118->12119|R2:238->239|R1:263->264|
dbf4f576-b287-0eb7-50c1-0d4254390d55	2021-03-14 19:35:54.335	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:35:54.327+00	2021-03-14 15:35:54.367+00	Tape:12119->12120|R2:239->240|R1:264->265|
9d70a80e-4a73-e147-7626-ad7e2fd29c75	2021-03-14 19:37:55.331	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:37:55.322+00	2021-03-14 15:37:55.36+00	Tape:12120->12121|R2:240->241|R1:265->266|
38586924-0b5a-cedf-21c7-513f9e6a67c8	2021-03-14 19:39:56.33	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:39:56.322+00	2021-03-14 15:39:56.36+00	Tape:12121->12122|R2:241->242|R1:266->267|
55240034-bb79-5990-3b45-e14e3faeebd3	2021-03-14 19:41:57.334	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:41:57.324+00	2021-03-14 15:41:57.363+00	Tape:12122->12123|R2:242->243|R1:267->268|
596f8a15-e557-ffa8-2035-4033eb7696f0	2021-03-14 19:43:58.331	admin	\N	e3957b47-c1ed-f35e-e2c9-52d175ea4b69	localhost:8080/cuba	2021-03-14 15:43:58.322+00	2021-03-14 15:43:58.362+00	Tape:12123->12124|R2:243->244|R1:268->269|
\.


--
-- TOC entry 3563 (class 0 OID 37233)
-- Dependencies: 252
-- Data for Name: sys_scheduled_task; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_scheduled_task (id, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, defined_by, class_name, script_name, bean_name, method_name, method_params, user_name, is_singleton, is_active, period_, timeout, start_date, time_frame, start_delay, permitted_servers, log_start, log_finish, last_start_time, last_start_server, description, cron, scheduling_type) FROM stdin;
e3957b47-c1ed-f35e-e2c9-52d175ea4b69	2021-03-05 11:59:25.165	admin	2021-03-05 13:24:41.124	admin	\N	\N	\N	B	\N	\N	ratlab_Resources	addConsumables	<?xml version="1.0" encoding="UTF-8"?>\n\n<params>\n  <param type="java.lang.String" name="count">1</param>\n</params>\n	admin	f	t	120	\N	\N	\N	\N	\N	t	t	\N	\N	\N	\N	P
\.


--
-- TOC entry 3564 (class 0 OID 37241)
-- Dependencies: 253
-- Data for Name: sys_sending_attachment; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_sending_attachment (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, message_id, content, content_file_id, content_id, name, disposition, text_encoding) FROM stdin;
\.


--
-- TOC entry 3565 (class 0 OID 37248)
-- Dependencies: 254
-- Data for Name: sys_sending_message; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_sending_message (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, address_to, address_cc, address_bcc, address_from, caption, email_headers, content_text, content_text_file_id, deadline, status, date_sent, attempts_count, attempts_made, attachments_name, body_content_type) FROM stdin;
\.


--
-- TOC entry 3566 (class 0 OID 37255)
-- Dependencies: 255
-- Data for Name: sys_server; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.sys_server (id, create_ts, created_by, update_ts, updated_by, name, is_running, data) FROM stdin;
57c74db2-a994-2073-2440-f431127555af	2021-03-02 16:56:25.517	\N	2021-03-05 19:56:11.511	\N	localhost:8080/app-core	t	\N
095fc4f5-df9d-311a-856f-98270da74e6e	2021-03-11 11:26:42.385	\N	2021-03-14 19:45:19.408	\N	localhost:8080/cuba	t	\N
\.


--
-- TOC entry 3571 (class 0 OID 37733)
-- Dependencies: 260
-- Data for Name: ui_filter_configuration; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ui_filter_configuration (id, component_id, configuration_id, username, root_condition, sys_tenant_id, name, default_for_all) FROM stdin;
\.


--
-- TOC entry 3569 (class 0 OID 37717)
-- Dependencies: 258
-- Data for Name: ui_setting; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ui_setting (id, create_ts, created_by, username, name, value_) FROM stdin;
d952065f-e48d-b45d-14eb-0185444ee8e3	2021-03-12 19:16:49.948	admin	admin	sys$ScheduledTask.browse	<?xml version="1.0" encoding="UTF-8"?>\n\n<settings>\n  <components>\n    <component name="tasksFilter">\n      <defaultFilter/>\n    </component>\n    <component name="tasksTable">\n      <columns>\n        <columns id="active" visible="true"/>\n        <columns id="beanName" visible="true"/>\n        <columns id="methodName" visible="true"/>\n        <columns id="className" visible="true"/>\n        <columns id="scriptName" visible="true"/>\n        <columns id="userName" visible="true"/>\n        <columns id="singleton" visible="true"/>\n        <columns id="schedulingType" visible="true"/>\n        <columns id="cron" visible="true"/>\n        <columns id="period" visible="true"/>\n        <columns id="timeout" visible="true"/>\n        <columns id="startDate" visible="true"/>\n        <columns id="timeFrame" visible="true"/>\n        <columns id="permittedServers" visible="true"/>\n        <columns id="logStart" visible="true"/>\n        <columns id="logFinish" visible="true"/>\n        <columns id="methodParametersString" visible="true"/>\n        <columns id="description" visible="true"/>\n      </columns>\n      <groupProperties/>\n    </component>\n  </components>\n</settings>\n
\.


--
-- TOC entry 3570 (class 0 OID 37725)
-- Dependencies: 259
-- Data for Name: ui_table_presentation; Type: TABLE DATA; Schema: public; Owner: cuba
--

COPY public.ui_table_presentation (id, create_ts, created_by, component, name, settings, username, is_auto_save, update_ts, updated_by, sys_tenant_id) FROM stdin;
\.


--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 249
-- Name: sys_query_result_seq; Type: SEQUENCE SET; Schema: public; Owner: cuba
--

SELECT pg_catalog.setval('public.sys_query_result_seq', 1, false);


--
-- TOC entry 3314 (class 2606 OID 37710)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 37802)
-- Name: persistent_logins persistent_logins_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.persistent_logins
    ADD CONSTRAINT persistent_logins_pkey PRIMARY KEY (series);


--
-- TOC entry 3128 (class 2606 OID 37267)
-- Name: ratlab_certificate ratlab_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_certificate
    ADD CONSTRAINT ratlab_certificate_pkey PRIMARY KEY (id);


--
-- TOC entry 3132 (class 2606 OID 37269)
-- Name: ratlab_employee ratlab_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee
    ADD CONSTRAINT ratlab_employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3134 (class 2606 OID 37271)
-- Name: ratlab_employee_research_link ratlab_employee_research_link_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee_research_link
    ADD CONSTRAINT ratlab_employee_research_link_pkey PRIMARY KEY (employee_id, research_id);


--
-- TOC entry 3139 (class 2606 OID 37273)
-- Name: ratlab_laboratory ratlab_laboratory_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_laboratory
    ADD CONSTRAINT ratlab_laboratory_pkey PRIMARY KEY (id);


--
-- TOC entry 3141 (class 2606 OID 37275)
-- Name: ratlab_misc_resource ratlab_misc_resource_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_misc_resource
    ADD CONSTRAINT ratlab_misc_resource_pkey PRIMARY KEY (id);


--
-- TOC entry 3143 (class 2606 OID 37277)
-- Name: ratlab_rat ratlab_rat_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_rat
    ADD CONSTRAINT ratlab_rat_pkey PRIMARY KEY (id);


--
-- TOC entry 3145 (class 2606 OID 37279)
-- Name: ratlab_research ratlab_research_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_research
    ADD CONSTRAINT ratlab_research_pkey PRIMARY KEY (id);


--
-- TOC entry 3148 (class 2606 OID 37281)
-- Name: ratlab_research_requirement ratlab_research_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_research_requirement
    ADD CONSTRAINT ratlab_research_requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 3152 (class 2606 OID 37283)
-- Name: ratlab_resource_requirement ratlab_resource_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_resource_requirement
    ADD CONSTRAINT ratlab_resource_requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 3156 (class 2606 OID 37285)
-- Name: ratlab_subject_requirement ratlab_subject_requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_subject_requirement
    ADD CONSTRAINT ratlab_subject_requirement_pkey PRIMARY KEY (id);


--
-- TOC entry 3160 (class 2606 OID 37287)
-- Name: report_execution report_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT report_execution_pkey PRIMARY KEY (id);


--
-- TOC entry 3164 (class 2606 OID 37289)
-- Name: report_group report_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_group
    ADD CONSTRAINT report_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3168 (class 2606 OID 37291)
-- Name: report_report report_report_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_report
    ADD CONSTRAINT report_report_pkey PRIMARY KEY (id);


--
-- TOC entry 3170 (class 2606 OID 37293)
-- Name: report_template report_template_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_template
    ADD CONSTRAINT report_template_pkey PRIMARY KEY (id);


--
-- TOC entry 3173 (class 2606 OID 37295)
-- Name: sec_constraint sec_constraint_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_constraint
    ADD CONSTRAINT sec_constraint_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 37297)
-- Name: sec_entity_log sec_entity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_entity_log
    ADD CONSTRAINT sec_entity_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3182 (class 2606 OID 37299)
-- Name: sec_filter sec_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_filter
    ADD CONSTRAINT sec_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 37301)
-- Name: sec_group_hierarchy sec_group_hierarchy_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_pkey PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 37303)
-- Name: sec_group sec_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group
    ADD CONSTRAINT sec_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 37305)
-- Name: sec_localized_constraint_msg sec_localized_constraint_msg_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_localized_constraint_msg
    ADD CONSTRAINT sec_localized_constraint_msg_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 37307)
-- Name: sec_logged_attr sec_logged_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT sec_logged_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 37309)
-- Name: sec_logged_attr sec_logged_attr_uniq_name; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT sec_logged_attr_uniq_name UNIQUE (entity_id, name);


--
-- TOC entry 3198 (class 2606 OID 37311)
-- Name: sec_logged_entity sec_logged_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_entity
    ADD CONSTRAINT sec_logged_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 37313)
-- Name: sec_logged_entity sec_logged_entity_uniq_name; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_entity
    ADD CONSTRAINT sec_logged_entity_uniq_name UNIQUE (name);


--
-- TOC entry 3203 (class 2606 OID 37315)
-- Name: sec_permission sec_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_permission
    ADD CONSTRAINT sec_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 37317)
-- Name: sec_presentation sec_presentation_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_presentation
    ADD CONSTRAINT sec_presentation_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 37319)
-- Name: sec_remember_me sec_remember_me_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_remember_me
    ADD CONSTRAINT sec_remember_me_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 37767)
-- Name: sec_resource_policy sec_resource_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_resource_policy
    ADD CONSTRAINT sec_resource_policy_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 37749)
-- Name: sec_resource_role sec_resource_role_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_resource_role
    ADD CONSTRAINT sec_resource_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 37795)
-- Name: sec_role_assignment sec_role_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_role_assignment
    ADD CONSTRAINT sec_role_assignment_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 37321)
-- Name: sec_role sec_role_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_role
    ADD CONSTRAINT sec_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 37781)
-- Name: sec_row_level_policy sec_row_level_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_row_level_policy
    ADD CONSTRAINT sec_row_level_policy_pkey PRIMARY KEY (id);


--
-- TOC entry 3326 (class 2606 OID 37758)
-- Name: sec_row_level_role sec_row_level_role_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_row_level_role
    ADD CONSTRAINT sec_row_level_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 37323)
-- Name: sec_screen_history sec_screen_history_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT sec_screen_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 37325)
-- Name: sec_search_folder sec_search_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT sec_search_folder_pkey PRIMARY KEY (folder_id);


--
-- TOC entry 3228 (class 2606 OID 37327)
-- Name: sec_session_attr sec_session_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_attr
    ADD CONSTRAINT sec_session_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 37329)
-- Name: sec_session_log sec_session_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT sec_session_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3238 (class 2606 OID 37331)
-- Name: sec_user sec_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user
    ADD CONSTRAINT sec_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 37333)
-- Name: sec_user_role sec_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 37335)
-- Name: sec_user_setting sec_user_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_pkey PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 37337)
-- Name: sec_user_setting sec_user_setting_uniq; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_uniq UNIQUE (user_id, name, client_type);


--
-- TOC entry 3248 (class 2606 OID 37339)
-- Name: sec_user_substitution sec_user_substitution_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT sec_user_substitution_pkey PRIMARY KEY (id);


--
-- TOC entry 3250 (class 2606 OID 37341)
-- Name: sys_app_folder sys_app_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_app_folder
    ADD CONSTRAINT sys_app_folder_pkey PRIMARY KEY (folder_id);


--
-- TOC entry 3256 (class 2606 OID 37343)
-- Name: sys_attr_value sys_attr_value_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 37345)
-- Name: sys_category_attr sys_category_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_category_attr
    ADD CONSTRAINT sys_category_attr_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 37347)
-- Name: sys_category sys_category_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_category
    ADD CONSTRAINT sys_category_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 37349)
-- Name: sys_config sys_config_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_config
    ADD CONSTRAINT sys_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 37351)
-- Name: sys_db_changelog sys_db_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_db_changelog
    ADD CONSTRAINT sys_db_changelog_pkey PRIMARY KEY (script_name);


--
-- TOC entry 3274 (class 2606 OID 37353)
-- Name: sys_entity_snapshot sys_entity_snapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_entity_snapshot
    ADD CONSTRAINT sys_entity_snapshot_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 37355)
-- Name: sys_entity_statistics sys_entity_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_entity_statistics
    ADD CONSTRAINT sys_entity_statistics_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 37357)
-- Name: sys_file sys_file_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_file
    ADD CONSTRAINT sys_file_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 37359)
-- Name: sys_folder sys_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_folder
    ADD CONSTRAINT sys_folder_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 37361)
-- Name: sys_fts_queue sys_fts_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_fts_queue
    ADD CONSTRAINT sys_fts_queue_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 37363)
-- Name: sys_jmx_instance sys_jmx_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_jmx_instance
    ADD CONSTRAINT sys_jmx_instance_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 37365)
-- Name: sys_lock_config sys_lock_config_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_lock_config
    ADD CONSTRAINT sys_lock_config_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 37367)
-- Name: sys_query_result sys_query_result_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_query_result
    ADD CONSTRAINT sys_query_result_pkey PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 37369)
-- Name: sys_scheduled_execution sys_scheduled_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_scheduled_execution
    ADD CONSTRAINT sys_scheduled_execution_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 37371)
-- Name: sys_scheduled_task sys_scheduled_task_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_scheduled_task
    ADD CONSTRAINT sys_scheduled_task_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 37373)
-- Name: sys_sending_attachment sys_sending_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT sys_sending_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 37375)
-- Name: sys_sending_message sys_sending_message_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_message
    ADD CONSTRAINT sys_sending_message_pkey PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 37377)
-- Name: sys_server sys_server_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_server
    ADD CONSTRAINT sys_server_pkey PRIMARY KEY (id);


--
-- TOC entry 3320 (class 2606 OID 37740)
-- Name: ui_filter_configuration ui_filter_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ui_filter_configuration
    ADD CONSTRAINT ui_filter_configuration_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 37724)
-- Name: ui_setting ui_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ui_setting
    ADD CONSTRAINT ui_setting_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 37732)
-- Name: ui_table_presentation ui_table_presentation_pkey; Type: CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ui_table_presentation
    ADD CONSTRAINT ui_table_presentation_pkey PRIMARY KEY (id);


--
-- TOC entry 3260 (class 1259 OID 37378)
-- Name: idx_cat_attr_ent_type_and_code; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_cat_attr_ent_type_and_code ON public.sys_category_attr USING btree (category_entity_type, code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3125 (class 1259 OID 37379)
-- Name: idx_ratlab_certificate_on_owner; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_certificate_on_owner ON public.ratlab_certificate USING btree (owner_id);


--
-- TOC entry 3126 (class 1259 OID 37380)
-- Name: idx_ratlab_certificate_uk_code; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_ratlab_certificate_uk_code ON public.ratlab_certificate USING btree (code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3129 (class 1259 OID 37381)
-- Name: idx_ratlab_employee_on_laboratory; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_employee_on_laboratory ON public.ratlab_employee USING btree (laboratory_id);


--
-- TOC entry 3130 (class 1259 OID 37382)
-- Name: idx_ratlab_employee_on_supervisor; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_employee_on_supervisor ON public.ratlab_employee USING btree (supervisor_id);


--
-- TOC entry 3135 (class 1259 OID 37383)
-- Name: idx_ratlab_laboratory_uk_code; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_ratlab_laboratory_uk_code ON public.ratlab_laboratory USING btree (code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3136 (class 1259 OID 37384)
-- Name: idx_ratlab_laboratory_uk_day_end; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_ratlab_laboratory_uk_day_end ON public.ratlab_laboratory USING btree (day_end) WHERE (delete_ts IS NULL);


--
-- TOC entry 3137 (class 1259 OID 37385)
-- Name: idx_ratlab_laboratory_uk_title; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_ratlab_laboratory_uk_title ON public.ratlab_laboratory USING btree (title) WHERE (delete_ts IS NULL);


--
-- TOC entry 3146 (class 1259 OID 37386)
-- Name: idx_ratlab_research_requirement_on_research; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_research_requirement_on_research ON public.ratlab_research_requirement USING btree (research_id);


--
-- TOC entry 3149 (class 1259 OID 37387)
-- Name: idx_ratlab_resource_requirement_on_research; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_resource_requirement_on_research ON public.ratlab_resource_requirement USING btree (research_id);


--
-- TOC entry 3150 (class 1259 OID 37388)
-- Name: idx_ratlab_resource_requirement_on_resource; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_resource_requirement_on_resource ON public.ratlab_resource_requirement USING btree (resource_id);


--
-- TOC entry 3153 (class 1259 OID 37389)
-- Name: idx_ratlab_subject_requirement_on_research; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_subject_requirement_on_research ON public.ratlab_subject_requirement USING btree (research_id);


--
-- TOC entry 3154 (class 1259 OID 37390)
-- Name: idx_ratlab_subject_requirement_on_subject; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_ratlab_subject_requirement_on_subject ON public.ratlab_subject_requirement USING btree (subject_id);


--
-- TOC entry 3157 (class 1259 OID 37391)
-- Name: idx_report_execution_report_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_report_execution_report_id ON public.report_execution USING btree (report_id);


--
-- TOC entry 3158 (class 1259 OID 37392)
-- Name: idx_report_execution_start_time; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_report_execution_start_time ON public.report_execution USING btree (start_time);


--
-- TOC entry 3161 (class 1259 OID 37393)
-- Name: idx_report_group_uniq_title; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_report_group_uniq_title ON public.report_group USING btree (title) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3162 (class 1259 OID 37394)
-- Name: idx_report_group_uniq_title_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_report_group_uniq_title_sys_tenant_id_nn ON public.report_group USING btree (title, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3165 (class 1259 OID 37395)
-- Name: idx_report_report_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_report_report_uniq_name ON public.report_report USING btree (name) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3166 (class 1259 OID 37396)
-- Name: idx_report_report_uniq_name_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_report_report_uniq_name_sys_tenant_id_nn ON public.report_report USING btree (name, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3321 (class 1259 OID 37796)
-- Name: idx_resource_role_un_c; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_resource_role_un_c ON public.sec_resource_role USING btree (code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3324 (class 1259 OID 37797)
-- Name: idx_row_level_role_un_c; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_row_level_role_un_c ON public.sec_row_level_role USING btree (code) WHERE (delete_ts IS NULL);


--
-- TOC entry 3171 (class 1259 OID 37397)
-- Name: idx_sec_constraint_group; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_constraint_group ON public.sec_constraint USING btree (group_id);


--
-- TOC entry 3174 (class 1259 OID 37398)
-- Name: idx_sec_entity_log_entity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_entity_log_entity_id ON public.sec_entity_log USING btree (entity_id);


--
-- TOC entry 3175 (class 1259 OID 37399)
-- Name: idx_sec_entity_log_ientity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_entity_log_ientity_id ON public.sec_entity_log USING btree (int_entity_id);


--
-- TOC entry 3176 (class 1259 OID 37400)
-- Name: idx_sec_entity_log_lentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_entity_log_lentity_id ON public.sec_entity_log USING btree (long_entity_id);


--
-- TOC entry 3177 (class 1259 OID 37401)
-- Name: idx_sec_entity_log_sentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_entity_log_sentity_id ON public.sec_entity_log USING btree (string_entity_id);


--
-- TOC entry 3180 (class 1259 OID 37402)
-- Name: idx_sec_filter_component_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_filter_component_user ON public.sec_filter USING btree (component, user_id);


--
-- TOC entry 3183 (class 1259 OID 37403)
-- Name: idx_sec_group_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_group_uniq_name ON public.sec_group USING btree (name) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3184 (class 1259 OID 37404)
-- Name: idx_sec_group_uniq_name_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_group_uniq_name_sys_tenant_id_nn ON public.sec_group USING btree (name, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3189 (class 1259 OID 37405)
-- Name: idx_sec_loc_cnstrnt_msg_unique; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_loc_cnstrnt_msg_unique ON public.sec_localized_constraint_msg USING btree (entity_name, operation_type) WHERE (delete_ts IS NULL);


--
-- TOC entry 3192 (class 1259 OID 37406)
-- Name: idx_sec_logged_attr_entity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_logged_attr_entity ON public.sec_logged_attr USING btree (entity_id);


--
-- TOC entry 3201 (class 1259 OID 37407)
-- Name: idx_sec_permission_unique; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_permission_unique ON public.sec_permission USING btree (role_id, permission_type, target) WHERE (delete_ts IS NULL);


--
-- TOC entry 3204 (class 1259 OID 37408)
-- Name: idx_sec_presentation_component_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_presentation_component_user ON public.sec_presentation USING btree (component, user_id);


--
-- TOC entry 3207 (class 1259 OID 37409)
-- Name: idx_sec_remember_me_token; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_remember_me_token ON public.sec_remember_me USING btree (token);


--
-- TOC entry 3208 (class 1259 OID 37410)
-- Name: idx_sec_remember_me_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_remember_me_user ON public.sec_remember_me USING btree (user_id);


--
-- TOC entry 3211 (class 1259 OID 37411)
-- Name: idx_sec_role_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_role_uniq_name ON public.sec_role USING btree (name) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3212 (class 1259 OID 37412)
-- Name: idx_sec_role_uniq_name_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_role_uniq_name_sys_tenant_id_nn ON public.sec_role USING btree (name, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3215 (class 1259 OID 37413)
-- Name: idx_sec_screen_hist_sub_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_hist_sub_user ON public.sec_screen_history USING btree (substituted_user_id);


--
-- TOC entry 3216 (class 1259 OID 37414)
-- Name: idx_sec_screen_history_entity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_entity_id ON public.sec_screen_history USING btree (entity_id);


--
-- TOC entry 3217 (class 1259 OID 37415)
-- Name: idx_sec_screen_history_ientity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_ientity_id ON public.sec_screen_history USING btree (int_entity_id);


--
-- TOC entry 3218 (class 1259 OID 37416)
-- Name: idx_sec_screen_history_lentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_lentity_id ON public.sec_screen_history USING btree (long_entity_id);


--
-- TOC entry 3219 (class 1259 OID 37417)
-- Name: idx_sec_screen_history_sentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_sentity_id ON public.sec_screen_history USING btree (string_entity_id);


--
-- TOC entry 3220 (class 1259 OID 37418)
-- Name: idx_sec_screen_history_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_screen_history_user ON public.sec_screen_history USING btree (user_id);


--
-- TOC entry 3223 (class 1259 OID 37419)
-- Name: idx_sec_search_folder_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_search_folder_user ON public.sec_search_folder USING btree (user_id);


--
-- TOC entry 3226 (class 1259 OID 37420)
-- Name: idx_sec_session_attr_group; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_session_attr_group ON public.sec_session_attr USING btree (group_id);


--
-- TOC entry 3229 (class 1259 OID 37421)
-- Name: idx_sec_session_log_session; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_session_log_session ON public.sec_session_log USING btree (session_id);


--
-- TOC entry 3230 (class 1259 OID 37422)
-- Name: idx_sec_session_log_subuser; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_session_log_subuser ON public.sec_session_log USING btree (substituted_user_id);


--
-- TOC entry 3231 (class 1259 OID 37423)
-- Name: idx_sec_session_log_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_session_log_user ON public.sec_session_log USING btree (user_id);


--
-- TOC entry 3239 (class 1259 OID 37424)
-- Name: idx_sec_user_role_uniq_role; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_user_role_uniq_role ON public.sec_user_role USING btree (user_id, role_id) WHERE (delete_ts IS NULL);


--
-- TOC entry 3246 (class 1259 OID 37425)
-- Name: idx_sec_user_substitution_user; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sec_user_substitution_user ON public.sec_user_substitution USING btree (user_id);


--
-- TOC entry 3235 (class 1259 OID 37426)
-- Name: idx_sec_user_uniq_login; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_user_uniq_login ON public.sec_user USING btree (login_lc) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));


--
-- TOC entry 3236 (class 1259 OID 37427)
-- Name: idx_sec_user_uniq_login_sys_tenant_id_nn; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sec_user_uniq_login_sys_tenant_id_nn ON public.sec_user USING btree (login_lc, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));


--
-- TOC entry 3232 (class 1259 OID 37428)
-- Name: idx_session_log_started_ts; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_session_log_started_ts ON public.sec_session_log USING btree (started_ts DESC);


--
-- TOC entry 3251 (class 1259 OID 37429)
-- Name: idx_sys_attr_value_entity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_attr_value_entity ON public.sys_attr_value USING btree (entity_id);


--
-- TOC entry 3252 (class 1259 OID 37430)
-- Name: idx_sys_attr_value_ientity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_attr_value_ientity ON public.sys_attr_value USING btree (int_entity_id);


--
-- TOC entry 3253 (class 1259 OID 37431)
-- Name: idx_sys_attr_value_lentity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_attr_value_lentity ON public.sys_attr_value USING btree (long_entity_id);


--
-- TOC entry 3254 (class 1259 OID 37432)
-- Name: idx_sys_attr_value_sentity; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_attr_value_sentity ON public.sys_attr_value USING btree (string_entity_id);


--
-- TOC entry 3261 (class 1259 OID 37433)
-- Name: idx_sys_category_attr_category; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_category_attr_category ON public.sys_category_attr USING btree (category_id);


--
-- TOC entry 3257 (class 1259 OID 37434)
-- Name: idx_sys_category_uniq_name_entity_type; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sys_category_uniq_name_entity_type ON public.sys_category USING btree (name, entity_type) WHERE (delete_ts IS NULL);


--
-- TOC entry 3264 (class 1259 OID 37435)
-- Name: idx_sys_config_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sys_config_uniq_name ON public.sys_config USING btree (name);


--
-- TOC entry 3269 (class 1259 OID 37436)
-- Name: idx_sys_entity_snapshot_entity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_entity_snapshot_entity_id ON public.sys_entity_snapshot USING btree (entity_id);


--
-- TOC entry 3270 (class 1259 OID 37437)
-- Name: idx_sys_entity_snapshot_ientity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_entity_snapshot_ientity_id ON public.sys_entity_snapshot USING btree (int_entity_id);


--
-- TOC entry 3271 (class 1259 OID 37438)
-- Name: idx_sys_entity_snapshot_lentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_entity_snapshot_lentity_id ON public.sys_entity_snapshot USING btree (long_entity_id);


--
-- TOC entry 3272 (class 1259 OID 37439)
-- Name: idx_sys_entity_snapshot_sentity_id; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_entity_snapshot_sentity_id ON public.sys_entity_snapshot USING btree (string_entity_id);


--
-- TOC entry 3275 (class 1259 OID 37440)
-- Name: idx_sys_entity_statistics_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sys_entity_statistics_uniq_name ON public.sys_entity_statistics USING btree (name);


--
-- TOC entry 3282 (class 1259 OID 37441)
-- Name: idx_sys_fts_queue_idxhost_crts; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_fts_queue_idxhost_crts ON public.sys_fts_queue USING btree (indexing_host, create_ts);


--
-- TOC entry 3289 (class 1259 OID 37442)
-- Name: idx_sys_query_result_entity_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_entity_session_key ON public.sys_query_result USING btree (entity_id, session_id, query_key);


--
-- TOC entry 3290 (class 1259 OID 37443)
-- Name: idx_sys_query_result_ientity_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_ientity_session_key ON public.sys_query_result USING btree (int_entity_id, session_id, query_key);


--
-- TOC entry 3291 (class 1259 OID 37444)
-- Name: idx_sys_query_result_lentity_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_lentity_session_key ON public.sys_query_result USING btree (long_entity_id, session_id, query_key);


--
-- TOC entry 3292 (class 1259 OID 37445)
-- Name: idx_sys_query_result_sentity_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_sentity_session_key ON public.sys_query_result USING btree (string_entity_id, session_id, query_key);


--
-- TOC entry 3293 (class 1259 OID 37446)
-- Name: idx_sys_query_result_session_key; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_query_result_session_key ON public.sys_query_result USING btree (session_id, query_key);


--
-- TOC entry 3296 (class 1259 OID 37447)
-- Name: idx_sys_scheduled_execution_task_finish_time; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_scheduled_execution_task_finish_time ON public.sys_scheduled_execution USING btree (task_id, finish_time);


--
-- TOC entry 3297 (class 1259 OID 37448)
-- Name: idx_sys_scheduled_execution_task_start_time; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_scheduled_execution_task_start_time ON public.sys_scheduled_execution USING btree (task_id, start_time);


--
-- TOC entry 3305 (class 1259 OID 37449)
-- Name: idx_sys_sending_message_date_sent; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_sending_message_date_sent ON public.sys_sending_message USING btree (date_sent);


--
-- TOC entry 3306 (class 1259 OID 37450)
-- Name: idx_sys_sending_message_status; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_sending_message_status ON public.sys_sending_message USING btree (status);


--
-- TOC entry 3307 (class 1259 OID 37451)
-- Name: idx_sys_sending_message_update_ts; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX idx_sys_sending_message_update_ts ON public.sys_sending_message USING btree (update_ts);


--
-- TOC entry 3310 (class 1259 OID 37452)
-- Name: idx_sys_server_uniq_name; Type: INDEX; Schema: public; Owner: cuba
--

CREATE UNIQUE INDEX idx_sys_server_uniq_name ON public.sys_server USING btree (name);


--
-- TOC entry 3302 (class 1259 OID 37453)
-- Name: sys_sending_attachment_message_idx; Type: INDEX; Schema: public; Owner: cuba
--

CREATE INDEX sys_sending_attachment_message_idx ON public.sys_sending_attachment USING btree (message_id);


--
-- TOC entry 3338 (class 2606 OID 37454)
-- Name: ratlab_employee_research_link fk_empres_on_employee; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee_research_link
    ADD CONSTRAINT fk_empres_on_employee FOREIGN KEY (employee_id) REFERENCES public.ratlab_employee(id);


--
-- TOC entry 3339 (class 2606 OID 37459)
-- Name: ratlab_employee_research_link fk_empres_on_research; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee_research_link
    ADD CONSTRAINT fk_empres_on_research FOREIGN KEY (research_id) REFERENCES public.ratlab_research(id);


--
-- TOC entry 3335 (class 2606 OID 37464)
-- Name: ratlab_certificate fk_ratlab_certificate_on_owner; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_certificate
    ADD CONSTRAINT fk_ratlab_certificate_on_owner FOREIGN KEY (owner_id) REFERENCES public.ratlab_employee(id);


--
-- TOC entry 3336 (class 2606 OID 37469)
-- Name: ratlab_employee fk_ratlab_employee_on_laboratory; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee
    ADD CONSTRAINT fk_ratlab_employee_on_laboratory FOREIGN KEY (laboratory_id) REFERENCES public.ratlab_laboratory(id);


--
-- TOC entry 3337 (class 2606 OID 37474)
-- Name: ratlab_employee fk_ratlab_employee_on_supervisor; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_employee
    ADD CONSTRAINT fk_ratlab_employee_on_supervisor FOREIGN KEY (supervisor_id) REFERENCES public.ratlab_employee(id);


--
-- TOC entry 3340 (class 2606 OID 37479)
-- Name: ratlab_research_requirement fk_ratlab_research_requirement_on_research; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_research_requirement
    ADD CONSTRAINT fk_ratlab_research_requirement_on_research FOREIGN KEY (research_id) REFERENCES public.ratlab_research(id);


--
-- TOC entry 3341 (class 2606 OID 37484)
-- Name: ratlab_resource_requirement fk_ratlab_resource_requirement_on_research; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_resource_requirement
    ADD CONSTRAINT fk_ratlab_resource_requirement_on_research FOREIGN KEY (research_id) REFERENCES public.ratlab_research(id);


--
-- TOC entry 3342 (class 2606 OID 37489)
-- Name: ratlab_resource_requirement fk_ratlab_resource_requirement_on_resource; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_resource_requirement
    ADD CONSTRAINT fk_ratlab_resource_requirement_on_resource FOREIGN KEY (resource_id) REFERENCES public.ratlab_misc_resource(id);


--
-- TOC entry 3343 (class 2606 OID 37494)
-- Name: ratlab_subject_requirement fk_ratlab_subject_requirement_on_research; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_subject_requirement
    ADD CONSTRAINT fk_ratlab_subject_requirement_on_research FOREIGN KEY (research_id) REFERENCES public.ratlab_research(id);


--
-- TOC entry 3344 (class 2606 OID 37499)
-- Name: ratlab_subject_requirement fk_ratlab_subject_requirement_on_subject; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.ratlab_subject_requirement
    ADD CONSTRAINT fk_ratlab_subject_requirement_on_subject FOREIGN KEY (subject_id) REFERENCES public.ratlab_rat(id);


--
-- TOC entry 3345 (class 2606 OID 37504)
-- Name: report_execution fk_report_execution_to_document; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT fk_report_execution_to_document FOREIGN KEY (output_document_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3346 (class 2606 OID 37509)
-- Name: report_execution fk_report_execution_to_report; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT fk_report_execution_to_report FOREIGN KEY (report_id) REFERENCES public.report_report(id) ON DELETE SET NULL;


--
-- TOC entry 3347 (class 2606 OID 37514)
-- Name: report_execution fk_report_execution_to_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT fk_report_execution_to_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3348 (class 2606 OID 37519)
-- Name: report_report fk_report_report_to_def_template; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_report
    ADD CONSTRAINT fk_report_report_to_def_template FOREIGN KEY (default_template_id) REFERENCES public.report_template(id);


--
-- TOC entry 3349 (class 2606 OID 37524)
-- Name: report_report fk_report_report_to_report_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_report
    ADD CONSTRAINT fk_report_report_to_report_group FOREIGN KEY (group_id) REFERENCES public.report_group(id);


--
-- TOC entry 3350 (class 2606 OID 37529)
-- Name: report_template fk_report_template_to_report; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.report_template
    ADD CONSTRAINT fk_report_template_to_report FOREIGN KEY (report_id) REFERENCES public.report_report(id) ON DELETE CASCADE;


--
-- TOC entry 3385 (class 2606 OID 37768)
-- Name: sec_resource_policy fk_res_policy_role; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_resource_policy
    ADD CONSTRAINT fk_res_policy_role FOREIGN KEY (role_id) REFERENCES public.sec_resource_role(id);


--
-- TOC entry 3386 (class 2606 OID 37782)
-- Name: sec_row_level_policy fk_row_level_policy_role; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_row_level_policy
    ADD CONSTRAINT fk_row_level_policy_role FOREIGN KEY (role_id) REFERENCES public.sec_row_level_role(id);


--
-- TOC entry 3352 (class 2606 OID 37534)
-- Name: sec_entity_log fk_sec_entity_log_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_entity_log
    ADD CONSTRAINT fk_sec_entity_log_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3353 (class 2606 OID 37539)
-- Name: sec_filter fk_sec_filter_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_filter
    ADD CONSTRAINT fk_sec_filter_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3361 (class 2606 OID 37544)
-- Name: sec_screen_history fk_sec_history_substituted_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT fk_sec_history_substituted_user FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3362 (class 2606 OID 37549)
-- Name: sec_screen_history fk_sec_history_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_screen_history
    ADD CONSTRAINT fk_sec_history_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3357 (class 2606 OID 37554)
-- Name: sec_logged_attr fk_sec_logged_attr_entity; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_logged_attr
    ADD CONSTRAINT fk_sec_logged_attr_entity FOREIGN KEY (entity_id) REFERENCES public.sec_logged_entity(id);


--
-- TOC entry 3360 (class 2606 OID 37559)
-- Name: sec_remember_me fk_sec_remember_me_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_remember_me
    ADD CONSTRAINT fk_sec_remember_me_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3363 (class 2606 OID 37564)
-- Name: sec_search_folder fk_sec_search_folder_folder; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_folder FOREIGN KEY (folder_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3364 (class 2606 OID 37569)
-- Name: sec_search_folder fk_sec_search_folder_presentation; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_presentation FOREIGN KEY (presentation_id) REFERENCES public.sec_presentation(id) ON DELETE SET NULL;


--
-- TOC entry 3365 (class 2606 OID 37574)
-- Name: sec_search_folder fk_sec_search_folder_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_search_folder
    ADD CONSTRAINT fk_sec_search_folder_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3367 (class 2606 OID 37579)
-- Name: sec_session_log fk_sec_session_log_subuser; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT fk_sec_session_log_subuser FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3368 (class 2606 OID 37584)
-- Name: sec_session_log fk_sec_session_log_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_log
    ADD CONSTRAINT fk_sec_session_log_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3373 (class 2606 OID 37589)
-- Name: sec_user_substitution fk_sec_user_substitution_substituted_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT fk_sec_user_substitution_substituted_user FOREIGN KEY (substituted_user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3374 (class 2606 OID 37594)
-- Name: sec_user_substitution fk_sec_user_substitution_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT fk_sec_user_substitution_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3375 (class 2606 OID 37599)
-- Name: sys_app_folder fk_sys_app_folder_folder; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_app_folder
    ADD CONSTRAINT fk_sys_app_folder_folder FOREIGN KEY (folder_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3379 (class 2606 OID 37604)
-- Name: sys_entity_snapshot fk_sys_entity_snapshot_author_id; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_entity_snapshot
    ADD CONSTRAINT fk_sys_entity_snapshot_author_id FOREIGN KEY (author_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3380 (class 2606 OID 37609)
-- Name: sys_folder fk_sys_folder_parent; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_folder
    ADD CONSTRAINT fk_sys_folder_parent FOREIGN KEY (parent_id) REFERENCES public.sys_folder(id);


--
-- TOC entry 3382 (class 2606 OID 37614)
-- Name: sys_sending_attachment fk_sys_sending_attachment_content_file; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT fk_sys_sending_attachment_content_file FOREIGN KEY (content_file_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3383 (class 2606 OID 37619)
-- Name: sys_sending_attachment fk_sys_sending_attachment_sending_message; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_attachment
    ADD CONSTRAINT fk_sys_sending_attachment_sending_message FOREIGN KEY (message_id) REFERENCES public.sys_sending_message(id);


--
-- TOC entry 3384 (class 2606 OID 37624)
-- Name: sys_sending_message fk_sys_sending_message_content_file; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_sending_message
    ADD CONSTRAINT fk_sys_sending_message_content_file FOREIGN KEY (content_text_file_id) REFERENCES public.sys_file(id);


--
-- TOC entry 3351 (class 2606 OID 37629)
-- Name: sec_constraint sec_constraint_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_constraint
    ADD CONSTRAINT sec_constraint_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3355 (class 2606 OID 37634)
-- Name: sec_group_hierarchy sec_group_hierarchy_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3356 (class 2606 OID 37639)
-- Name: sec_group_hierarchy sec_group_hierarchy_parent; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group_hierarchy
    ADD CONSTRAINT sec_group_hierarchy_parent FOREIGN KEY (parent_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3354 (class 2606 OID 37644)
-- Name: sec_group sec_group_parent; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_group
    ADD CONSTRAINT sec_group_parent FOREIGN KEY (parent_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3358 (class 2606 OID 37649)
-- Name: sec_permission sec_permission_role; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_permission
    ADD CONSTRAINT sec_permission_role FOREIGN KEY (role_id) REFERENCES public.sec_role(id);


--
-- TOC entry 3359 (class 2606 OID 37654)
-- Name: sec_presentation sec_presentation_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_presentation
    ADD CONSTRAINT sec_presentation_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3366 (class 2606 OID 37659)
-- Name: sec_session_attr sec_session_attr_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_session_attr
    ADD CONSTRAINT sec_session_attr_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3369 (class 2606 OID 37664)
-- Name: sec_user sec_user_group; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user
    ADD CONSTRAINT sec_user_group FOREIGN KEY (group_id) REFERENCES public.sec_group(id);


--
-- TOC entry 3370 (class 2606 OID 37669)
-- Name: sec_user_role sec_user_role_profile; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_profile FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3371 (class 2606 OID 37674)
-- Name: sec_user_role sec_user_role_role; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_role
    ADD CONSTRAINT sec_user_role_role FOREIGN KEY (role_id) REFERENCES public.sec_role(id);


--
-- TOC entry 3372 (class 2606 OID 37679)
-- Name: sec_user_setting sec_user_setting_user; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sec_user_setting
    ADD CONSTRAINT sec_user_setting_user FOREIGN KEY (user_id) REFERENCES public.sec_user(id);


--
-- TOC entry 3376 (class 2606 OID 37684)
-- Name: sys_attr_value sys_attr_value_attr_value_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_attr_value_parent_id FOREIGN KEY (parent_id) REFERENCES public.sys_attr_value(id);


--
-- TOC entry 3377 (class 2606 OID 37689)
-- Name: sys_attr_value sys_attr_value_category_attr_id; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_attr_value
    ADD CONSTRAINT sys_attr_value_category_attr_id FOREIGN KEY (category_attr_id) REFERENCES public.sys_category_attr(id);


--
-- TOC entry 3378 (class 2606 OID 37694)
-- Name: sys_category_attr sys_category_attr_category_id; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_category_attr
    ADD CONSTRAINT sys_category_attr_category_id FOREIGN KEY (category_id) REFERENCES public.sys_category(id);


--
-- TOC entry 3381 (class 2606 OID 37699)
-- Name: sys_scheduled_execution sys_scheduled_execution_task; Type: FK CONSTRAINT; Schema: public; Owner: cuba
--

ALTER TABLE ONLY public.sys_scheduled_execution
    ADD CONSTRAINT sys_scheduled_execution_task FOREIGN KEY (task_id) REFERENCES public.sys_scheduled_task(id);


-- Completed on 2021-03-14 19:45:48 +04

--
-- PostgreSQL database dump complete
--

