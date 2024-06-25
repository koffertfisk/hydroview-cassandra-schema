CREATE KEYSPACE hydroview WITH replication = {
    'class': 'NetworkTopologyStrategy', 
    'datacenter1': '2'
};