try:
    name = datastore.query(foo='bar')['user_name']
except KeyError:  # what could possibly go wrong?
    proceed_as_normal()
