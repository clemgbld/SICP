(rule (last-pair (?last) ?last))

(rule (last-pair (?u . ?v) ?last)
    (last-pair ?v (?u . ())))