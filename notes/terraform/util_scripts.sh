#!/usr/bin/bash
SCHEMA_FILE="somefileName.yaml"
SCHEMA_DEFINITION_ATTRIBUTES=(computed description_kind description max_items nesting_mode optional required sensitive type version);
COMMAND="cat $SCHEMA_FILE"
for i in ${SCHEMA_DEFINITION_ATTRIBUTES[@]} ;
do
   COMMAND+=" | yq e 'del(.. | .$i?)'";
done
echo $COMMAND
