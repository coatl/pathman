pathman is a tool for creating development environments from collections of 
directories. It's helpful when you are developing multiple interdependent 
libraries and you want changes in one library to be immediately visible in 
the other libraries which make use of it.

how to use:
put all your development directories into 1 toplevel directory. I call 
this the lab directory. create a pathman.pm file in the lab directory.
In the simplest case, pathman.pm can be empty. Then run the pathman 
command in your lab directory or one of its subdirectories. Pathman will 
search for sub-sub-directories of lab which appear to contain libraries
of ruby (and c) code, as well as bin directories containing commands, 
and update the RUBYLIB, LIBRARY_PATH, CPATH, and PATH environment 
variables to contain them.

For example, say you have 3 libraries which you're working on, foo, bar, 
and baz. Foo depends on bar, which depends on baz. You make changes in 
baz which you want to be immediately visible to foo and bar. You would
arrange you libraries in a toplevel lab directory like this:

  lab/
  +-pathman.pm
  +-foo/
  | +-lib/
  +-bar/
  | +-lib/
  +-baz/
    +-lib/

When pathman is run in lab/ or any of its subdirectories, it adds 
lab/foo/lib/, lab/bar/lib/ and lab/baz/lib/ to the RUBYPATH, and then 
drops you into a subshell. So then, if you were to execute:
  require 'foo.rb'
within a ruby program, it will find the foo.rb which lives in 
lab/foo/lib/.


