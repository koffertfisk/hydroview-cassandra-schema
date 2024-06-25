# Hydroview Cassandra Schema

This repository contains the schema definitions for an Apache Cassandra database described in the master thesis report "A Framework for Managing Big Environmental Science Data". It includes the keyspace definition, tables and user-defined types required for the `hydroview` keyspace.

## Directory Structure

- `schema/`: Contains the CQL files for keyspaces, tables, user-defined types, indexes, and functions.
  - `keyspace.cql`: Definition for the `hydroview` keyspace.
  - `tables/`: Directory containing CQL files for each table schema.
  - `user_defined_types/`: Directory containing CQL files for each user-defined type.
  

### Schema Guide

#### Keyspace

The `hydroview` keyspace is defined with the following replication strategy for small production environment:

```sql
CREATE KEYSPACE hydroview WITH replication = {
    'class': 'NetworkTopologyStrategy', 
    'datacenter1': '2'
};
```

If running locally, the following definition could be used instead to start up a single node:
```sql
CREATE KEYSPACE hydroview WITH replication = {
    'class': 'SimpleStrategy', 
    'replication_factor': '1'
};
```

#### User-Defined Types (UDTs)

##### `averages` 
Since measurements can be stored as either raw or average readings, groupings of minimum, average and
maximum values where each hold a FLOAT (32-bit floating point) data type.

##### `description` 
Long and short descriptions can be used for different presentation scenarios. Consider a simple web application; when users hover over a station located in a side menu, a short version is displayed. In contrast, when users view a certain station, a long version is outlined in the details. Both versions are, however, assumed be grouped resulting in this UDT.

##### `position`
The Global Position System (GPS) positions used for determining station
location, where its latitude and longitude are represented as 64-bit DOUBLEs to be able to provide higher accuracy

##### `thumbnails`
Thumbnails, or icon images of different sizes - from small to extra large - stored as binary files using the BLOB data type.

#### Tables
The tables (or column families) used in this keyspace generally fall into one of two categories: `metadata` and `measurements`.

##### Metadata
Column families designed to store information rather than actual measurements fall into the category of `metadata` which contains facts regarding stations, sensors and measurement intervals etc.

##### Measurements
Storage of measurement data, partitioned according to the monitoring schedule outlined in the master thesis report.