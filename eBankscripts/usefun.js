// JavaScript Document for validation

function Trim(VALUE)
{
	var w_space = String.fromCharCode(32);
	var v_length = VALUE.length;
	var strTemp = "";
	var iTemp = 0;
	
	if(v_length < 1){
						return"";
					}
	while(iTemp < v_length)
	{
		if(VALUE.charAt(iTemp) == w_space){	}
		else{
			strTemp = VALUE.substring(iTemp,v_length);
			break;
			}
		iTemp = iTemp + 1;
	}
	
	v_length=strTemp.length;
    iTemp = v_length -1;
	
	while(iTemp > -1)
	{
		if(strTemp.charAt(iTemp) == w_space){	}
		else{
			strTemp = strTemp.substring(0,iTemp +1);
			break;
		}
		iTemp = iTemp-1;
	}
	return strTemp;
} 



function validate(value,checkOk)
{
	var checkStr = value;
	var allValid = true;
			
			for (i = 0;  i < checkStr.length;  i++)
				{
					ch = checkStr.charAt(i);
					for (j = 0;  j < checkOk.length;  j++)
						if (ch == checkOk.charAt(j))
						break;
						if (j == checkOk.length)
						{
							allValid = false;
							break;
						}
				}
			
					if (!allValid)
					{
						return (false);
							
					}
					else { return (true); }
}

