Kind = "service-resolver"
Name = "order"
Failover = {
  "*" = {
    Datacenters = ["dc2"]
  }
}