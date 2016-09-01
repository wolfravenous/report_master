2.2.1 :001 > name='*'
 => "*"
2.2.1 :002 > name.include?'*'
 => true
2.2.1 :003 > name.sub'*','James'
 => "James"
2.2.1 :006 > puts name
*
 => nil
2.2.1 :007 > name
 => "*"
2.2.1 :009 > name='a*b'
 => "a*b"
2.2.1 :010 > name.include?'*'
 => true
2.2.1 :011 > name.sub'*','James'
 => "aJamesb"
2.2.1 :012 > name='a*b*c'
 => "a*b*c"
2.2.1 :013 > name.sub'*','James'
 => "aJamesb*c"
2.2.1 :014 > name='a*b*c'
 => "a*b*c"
2.2.1 :015 > name.gsub'*','James'
 => "aJamesbJamesc"
2.2.1 :016 > puts name
a*b*c
 => nil
2.2.1 :017 > name.gsub'*','James'.upcase
 => "aJAMESbJAMESc" 
2.2.1 :019 > name.gsub'*','james'.capitalize
 => "aJamesbJamesc"
2.2.1 :020 > name.gsub'*','he'.capitalize
 => "aHebHec"
2.2.1 :021 > name
 => "a*b*c"
2.2.1 :022 > name.gsub'*','he'.upcase
 => "aHEbHEc"
2.2.1 :023 > name.gsub'*',' heshe '.upcase
 => "a HESHE b HESHE c"
2.2.1 :024 > name=name.gsub'*',' heshe '.upcase
 => "a HESHE b HESHE c"
2.2.1 :025 > name
 => "a HESHE b HESHE c"
2.2.1 :027 > sex='f'
 => "f"
2.2.1 :028 > if sex=='f'
2.2.1 :029?>   name.gsub'HESHE','She'.capitalize
2.2.1 :030?>   end
 => "a She b She c"
