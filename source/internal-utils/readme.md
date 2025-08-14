# deployment

NOTE:::: NOW YOU DO THIS INSIDE OF lql/pg

1. run lql.test.js
2. lql export!!!
3. choose lql and svc as per usual.. all just works!


OLD WAY:


1. run the introspection test in pg

2. `lql export` inside of a sandbox lql repo

* name extension `rls`
* uncheck the `collections_public` during cli
* before you delete the `svc` extension's output, copy it over to launchql/pg for svc


3. 

```
cd packages/rls
# lql plan  # DO NOT RUN PLAN!!!!
lql package
```

* Then copy/paste the code from extension `sql/*.sql` into `rls-export`'s rls.sql
* leave the table rls alone
* you can delete `rls` package now (just keep `rls-export`)

4. test it

```
lql deploy --recursive --yes --createdb --project launchql-rls
```

5. publish it then install in launchql/pg

```
lql install @pyramation/launchql-ext-rls@<version>
```