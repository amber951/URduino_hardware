module PWM(input clk,input rst,input pwm_enable,input [7:0]swi,output reg pwm);
  
  parameter LOW_BOUND=48000,SD=370;
  
    reg [31:0]counter_d,counter_q;
    reg [7:0]swi_d,swi_q;
  
always@(*) 
begin
          swi_d=swi_q;
		  swi_d=swi;
           counter_d=counter_q+1;
         
           if(counter_q>=1000_000) begin  
             counter_d=0;
				 pwm=1;
				  
												end
				
				else if( counter_q<=(LOW_BOUND +(swi_q*SD)) ) 
                 pwm=1;
            
            else          
			     pwm=0;
	                                                  
end  
  always@(posedge clk or  posedge rst)
  begin
      if(rst)
        begin
        //pwm<=0;
        counter_q<=0;
        swi_q<=0;
         end
      else
          begin
  	        
            counter_q<=counter_d;
            swi_q<=swi_d;
            
          end   
      
  end
endmodule