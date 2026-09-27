# Oracle Database 26ai SQL and PL/SQL: The Complete Developer's Guide

The example code of the book **Oracle Database 26ai SQL and PL/SQL: The Complete Developer's Guide** by Vinish Kapoor — 677 examples,
each with the output it produced in Oracle AI Database 26ai Free (release 23.26), and the scripts
that install the book's sample schema, **Nimbus Air**, a fictional airline.

## Contents

- `setup/nimbus/` — the NIMBUS schema: `create-user.sql` (run as a DBA), `install.sql` (run as
  NIMBUS: tables, data, comments, statistics), `uninstall.sql`, and `files/`, the sample files
  that the examples of BFILEs, UTL_FILE, and external tables read.
- `setup/login.sql` — the SQLcl and SQL*Plus settings the examples ran with (Chapter 3).
- `setup/netlab/server.mjs` — a small local HTTP and SMTP test server for the networking examples of
  Chapter 54 (Node.js 18 or later). It sends no real e-mail.
- `examples/` — one folder per topic. Each `name.sql` is an example as the book prints it, and
  `name.out` the output it produced.

## Installing the Sample Schema

Chapter 5 of the book describes the steps. In short, with the container of Chapter 2:

1. Connect to the pluggable database as a DBA and run `setup/nimbus/create-user.sql`, which asks for
   a password for NIMBUS and creates the user, its privileges, and the directory `NIMBUS_FILES`.
2. Copy `setup/nimbus/files` to the directory's folder on the database server, for example:
   `docker exec db26ai mkdir -p /opt/oracle/nimbus_files`, then
   `docker cp setup/nimbus/files/. db26ai:/opt/oracle/nimbus_files/`.
3. Connect as NIMBUS and run `setup/nimbus/install.sql` from the `setup/nimbus` folder.
4. For the embedding examples of Chapters 21 and 61, download Oracle's prebuilt
   `all_MiniLM_L12_v2_augmented.zip` (linked from the *AI Vector Search User's Guide*), unzip it,
   and copy `all_MiniLM_L12_v2.onnx` to the same folder as the sample files. The example
   `vectors/11-load-onnx-model.sql` loads it.

## Running the Examples

Connect as NIMBUS with SQLcl, in the folder that contains `setup/login.sql` (or with `SQLPATH`
pointing to it), and run an example with `@examples/folder/name.sql`, or paste it.

Lines that start with `-- @` are instructions for the program that ran the examples for the
book, and are not printed in it:

- `-- @setup statement` prepares the example (for example, drops a table it creates) — run it first.
- `-- @cleanup statement` tidies up after the example — run it afterwards.
- `-- @connect sysdba` means the example runs as SYS (`sql / as sysdba`), in the pluggable
  database FREEPDB1 (`alter session set container = FREEPDB1`).
- `-- @client sqlplus` means the example ran in SQL*Plus instead of SQLcl.
- `-- @expect-error` marks an example that shows an error on purpose.

The examples of a chapter can depend on earlier ones of the same chapter; run them in order. Some
output depends on when and where you run an example — the current date, generated identifiers,
timings — and differs from the book's (Chapter 1 lists the cases).

## Examples by Chapter

### Part I — Getting Started

| Chapter | Examples |
|---|---|
| 1. How to Use This Book | [`character-functions`](examples/character-functions) (1) |
| 2. Installing Oracle AI Database 26ai Free | [`install`](examples/install) (4) |
| 3. SQL*Plus, SQLcl, and SQL Developer | [`tools`](examples/tools) (11) |
| 4. Database Basics for Developers | [`db-basics`](examples/db-basics) (8) |
| 5. The Nimbus Air Sample Schema | [`sample-schema`](examples/sample-schema) (4) |

### Part II — SQL Fundamentals

| Chapter | Examples |
|---|---|
| 6. Data Types | [`data-types`](examples/data-types) (11) |
| 7. Literals, Operators, Expressions, Conditions, and Pseudocolumns | [`basic-elements`](examples/basic-elements) (16) |
| 8. Format Models | [`format-models`](examples/format-models) (6) |

### Part III — Querying Data

| Chapter | Examples |
|---|---|
| 9. SELECT Basics | [`select-basics`](examples/select-basics) (11) |
| 10. Joins | [`joins`](examples/joins) (13) |
| 11. Aggregation and Grouping | [`grouping`](examples/grouping) (9) |
| 12. Subqueries and Set Operators | [`subqueries`](examples/subqueries) (8) |
| 13. The WITH Clause and Recursive Queries | [`with-clause`](examples/with-clause) (6) |
| 14. Hierarchical Queries | [`hierarchical`](examples/hierarchical) (6) |
| 15. Analytic Queries and Windows | [`analytic-queries`](examples/analytic-queries) (6) |
| 16. PIVOT, UNPIVOT, MATCH_RECOGNIZE, and MODEL | [`pivot-model`](examples/pivot-model) (9) |
| 17. Flashback Queries, Sampling, and Partition-Extended Names | [`flashback-sampling`](examples/flashback-sampling) (4) |
| 18. Property Graphs and SQL/PGQ | [`property-graphs`](examples/property-graphs) (7) |
| 19. JSON in SQL | [`json`](examples/json) (20) |
| 20. XML in SQL | [`xml`](examples/xml) (10) |
| 21. AI Vector Search | [`vectors`](examples/vectors) (13) |

### Part IV — SQL Functions Reference

| Chapter | Examples |
|---|---|
| 22. Character Functions | [`character-functions`](examples/character-functions) (22) |
| 23. Numeric and Bitwise Functions | [`numeric-functions`](examples/numeric-functions) (12) |
| 24. Date, Time, and Interval Functions | [`date-functions`](examples/date-functions) (22) |
| 25. Conversion Functions | [`conversion-functions`](examples/conversion-functions) (23) |
| 26. NULL-Related, Comparison, and Conditional Functions | [`null-functions`](examples/null-functions) (8) |
| 27. Aggregate Functions | [`aggregate-functions`](examples/aggregate-functions) (21) |
| 28. Analytic Functions | [`analytic-functions`](examples/analytic-functions) (9) |
| 29. LOB, Collection, Hashing, Encoding, and UUID Functions | [`misc-functions`](examples/misc-functions) (10) |
| 30. Environment, Identifier, Object, and Other Functions | [`environment-functions`](examples/environment-functions) (7) |
| 31. Machine Learning in the Database | [`machine-learning`](examples/machine-learning) (19) |

### Part V — Changing Data

| Chapter | Examples |
|---|---|
| 32. INSERT, UPDATE, DELETE, and MERGE | [`dml`](examples/dml) (17) |
| 33. Transactions and Locking | [`transactions`](examples/transactions) (13) |

### Part VI — Defining Data

| Chapter | Examples |
|---|---|
| 34. Tables | [`tables`](examples/tables) (17) |
| 35. Special Tables | [`special-tables`](examples/special-tables) (11) |
| 36. Views and Materialized Views | [`views`](examples/views) (12) |
| 37. Indexes | [`indexes`](examples/indexes) (11) |
| 38. Sequences, Synonyms, Domains, Assertions, and Other Schema Objects | [`schema-objects`](examples/schema-objects) (13) |
| 39. Users, Roles, and Privileges | [`security`](examples/security) (11) |
| 40. The Data Dictionary | [`dictionary`](examples/dictionary) (10) |

### Part VII — PL/SQL

| Chapter | Examples |
|---|---|
| 41. PL/SQL Blocks and Language Basics | [`plsql-basics`](examples/plsql-basics) (10) |
| 42. SQL in PL/SQL and Cursors | [`cursors`](examples/cursors) (9) |
| 43. Records and Collections | [`collections`](examples/collections) (7) |
| 44. Exceptions | [`exceptions`](examples/exceptions) (7) |
| 45. Procedures and Functions | [`subprograms`](examples/subprograms) (10) |
| 46. Packages | [`packages`](examples/packages) (8) |
| 47. Triggers | [`triggers`](examples/triggers) (10) |
| 48. Dynamic SQL and Bulk Processing | [`dynamic-bulk`](examples/dynamic-bulk) (11) |
| 49. Advanced PL/SQL | [`advanced-plsql`](examples/advanced-plsql) (9) |

### Part VIII — Built-in PL/SQL Packages

| Chapter | Examples |
|---|---|
| 50. Output, Utility, and Session Packages | [`pkg-utilities`](examples/pkg-utilities) (26) |
| 51. DBMS_SQL | [`pkg-dbms-sql`](examples/pkg-dbms-sql) (9) |
| 52. DBMS_LOB | [`pkg-dbms-lob`](examples/pkg-dbms-lob) (10) |
| 53. Raw Data, Encoding, and Text Utilities | [`pkg-raw-text`](examples/pkg-raw-text) (11) |
| 54. Files and Networking | [`pkg-files-network`](examples/pkg-files-network) (16) |
| 55. DBMS_SCHEDULER and DBMS_JOB | [`pkg-scheduler`](examples/pkg-scheduler) (9) |
| 56. Queues, Pipes, Alerts, and Change Notification | [`pkg-messaging`](examples/pkg-messaging) (9) |
| 57. Security Packages | [`pkg-security`](examples/pkg-security) (7) |
| 58. Metadata and Code Management | [`pkg-metadata`](examples/pkg-metadata) (5) |
| 59. JSON and SODA in PL/SQL | [`pkg-json`](examples/pkg-json) (7) |
| 60. XML in PL/SQL | [`pkg-xml`](examples/pkg-xml) (5) |
| 61. Vector, Search, and Text Packages | [`pkg-vector-text`](examples/pkg-vector-text) (9) |
| 62. DBMS_MLE | [`pkg-mle`](examples/pkg-mle) (3) |
| 63. Flashback, Comparison, Redefinition, and Parallel Execution | [`pkg-data-ops`](examples/pkg-data-ops) (6) |
| 64. Performance Packages | [`pkg-performance`](examples/pkg-performance) (9) |
| 65. Generic Types and Polymorphic Table Functions | [`pkg-generic-types`](examples/pkg-generic-types) (3) |
| 66. The PL/SQL Web Toolkit | [`pkg-web-toolkit`](examples/pkg-web-toolkit) (2) |

## License

The code of these examples may be used in your own applications. The book's text is copyright ©
2026 Vinish Kapoor; all rights reserved.
