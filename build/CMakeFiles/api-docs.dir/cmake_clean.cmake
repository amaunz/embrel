FILE(REMOVE_RECURSE
"CMakeFiles/api-docs"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/api-docs.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
