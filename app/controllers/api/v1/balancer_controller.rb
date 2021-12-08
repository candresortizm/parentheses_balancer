class Api::V1::BalancerController < ApplicationController
  
  def balance
    begin
      text=balance_params["text"]
      render json: {message:is_balanced(text)}, status: 200
    rescue => e
      render json: {message:"se ha presentado un error",detail:e}, status: 400
    end
  end

  def is_balanced(text)
    begin
      if text==""
          return "balanceado"
      elsif text.scan(/[a-zA-Z :()]/).join().length == text.length
          paren_arr = []
          smiles = 0
          for i in (0..text.length-1)
              case text[i]
              when "("
                  if text[i-1]!=":" or i==0
                      paren_arr.push("(")
                  end
              when ")"
                  if text[i-1]!=":"
                      if !paren_arr.empty?
                          paren_arr.pop 
                      else
                          return "desbalanceado"
                          break
                      end
                  else
                      #if !paren_arr.empty?
                      #    paren_arr.pop
                      #else
                          smiles+=1
                      #end
                  end
              end
          end
          if paren_arr.empty?
              return "balanceado"    
          else
              if smiles != 0 and paren_arr.length == smiles
                  return "balanceado"
              else
                  return "desbalanceado"    
              end
              
          end
      else 
          return "desbalanceado"
      end
    rescue => e
      render json: {message:"se ha presentado un error",detail:e}, status: 400
    end
  end

  private

  def balance_params
    params.require(:balancer).permit(:text)
  end
end
