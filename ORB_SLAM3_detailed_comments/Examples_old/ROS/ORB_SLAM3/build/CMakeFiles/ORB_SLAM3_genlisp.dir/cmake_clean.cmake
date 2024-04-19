file(REMOVE_RECURSE
  "../msg_gen"
  "../src/ORB_SLAM3/msg"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/ORB_SLAM3_genlisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
