<?php

class Engine
{
	
	public function renderAndPrint()
	{
		print $this->render();
	}
	
	public function render()
	{
		ob_start();
		
		require($this->_template);
		
		return ob_get_clean();
	}
}
