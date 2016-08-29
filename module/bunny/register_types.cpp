/* register_types.cpp */

#include "register_types.h"
#include "object_type_db.h"
#include "bunny.h"

void register_bunny_types() {

        ObjectTypeDB::register_type<Bunny>();
}

void unregister_bunny_types() {
   //nothing to do here
}
