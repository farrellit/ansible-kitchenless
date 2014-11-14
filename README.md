
### Warning!  

This is cobbled together from various serverspec, vagrant, and 
ansible docs.  I suspect the Rakefile especially is likely to evolve pretty 
significantly before it settles.

## Concept

Kitchen seems like a rather poor fit for ansible: kitchen converges and 
tests locally, which makes sense in the chef world (since chef runs locally )
but ansible and serverspec are both capable of connecting to remote hosts too,
and this seems  like a faster and more straightforward way to test.

What I'm doing here is providing a Vagrantfile, a spec/ directory with subdirs 
per server and also shared subdirs, and then a Rakefile that ties the two 
together 

`rake` will run vagrant, then ansible, then rspec
`rake ansible`, `rake spec` do what you'd expect.
`vagrant destroy -f` can be used to tear down.  

I rake may make for a convenient decoupling point between CI and the 
Vagrant and Serverspsec configs specific to each repo.  If `rake test` or 
whatever ran whatever backend tests were necessary, and then maybe a `rake build` 
or whatnot, then repos can vary on the backend but still provide a consitent 
interface to CI processes.


