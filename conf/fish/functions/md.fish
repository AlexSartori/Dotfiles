function md --description="Create a directory and cd to it."
	command mkdir -p $argv
	if test $status = 0
		cd $argv[(count $argv)]
	end
end
