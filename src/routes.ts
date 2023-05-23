import { Readable } from "stream"
import readLine from "readline"
import * as fs from 'fs';
import { client } from "./database/client";


interface Product {
    barcode: string;
    name: string;
    price: number;
    promo_active?: boolean;
    promo_start?: Date;
    promo_end?: Date;
    price_promo?: number;
}

const produtosSubs = {
    name: {
        start: 32,
        end: 212
    },
    barcode: {
        start: 214,
        end: 268
    },
    price: {
        start: 276,
        end: 318
    }
}


function regexFilter(input: string) {
    const regex = /[^a-zA-Z0-9\s]/g;
    const newText = input.replace(regex, '');
    return newText;
  }

  function removeAcento (text: string)
{       
    text = text.toUpperCase();                                                         
    text = text.replace(new RegExp('[ÁÀÂÃ]','gi'), 'A');
    text = text.replace(new RegExp('[ÉÈÊ]','gi'), 'E');
    text = text.replace(new RegExp('[ÍÌÎ]','gi'), 'I');
    text = text.replace(new RegExp('[ÓÒÔÕ]','gi'), 'O');
    text = text.replace(new RegExp('[ÚÙÛ]','gi'), 'U');
    text = text.replace(new RegExp('[Ç]','gi'), 'C');
    return text;                 
}


export default async function ImportProducts () {
    
    const file  = 'src/files/produtos.txt';
    
    var rl = readLine.createInterface({
        input : fs.createReadStream(file).setEncoding('binary'),
        output: process.stdout,
        terminal: false
    })
    rl.on('line',async function(line){
        if (line.length > 1 ) {
            const produto ={
                name: regexFilter(removeAcento(line.substring(produtosSubs.name.start, produtosSubs.name.end))),
                barcode: regexFilter(line.substring(produtosSubs.barcode.start, produtosSubs.barcode.end)),
                price: parseFloat(regexFilter(line.substring(produtosSubs.price.start, produtosSubs.price.end).replace(/\s/g, "")))/100  
            }
            
            
            if (!isNaN(produto.price ) || produto.name === null || produto.name === '') {

                
                const findProduct = await client.products.findFirst({
                    where: {
                        barcode: produto.barcode
                    }  
                })

                if (findProduct && findProduct.price != produto.price) {
                    
                    await client.products.update({
                        where: {
                            id: findProduct.id
                        },
                        data: {
                            name: produto.name,
                            price: produto.price
                        }
                    })

                } else {

                    await client.products.create({
                        data: {
                            barcode: produto.barcode,
                            name: produto.name,
                            price: produto.price
                        }
                    })

                }

                
                
            }
            
        }
    
    })
}




