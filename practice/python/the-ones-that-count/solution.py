def activity_time_ledger(activities: list[dict], targets: list[str]):
    total = 0
    for i in activities:
      if i["name"] in targets:
        total += i["minutes"]
    return total 
