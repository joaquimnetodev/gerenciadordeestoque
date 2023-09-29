//CÓDIGO QUEBRADO RECEBIDO PELA EQUIPE 4
//ESTE CÓDIGO FOI CONSERTADO E ESTÁ FUNCIONAL

//CONSERTADO POR JOAQUIM BATISTA DA SILVA NETO


programa {
  inclua biblioteca Tipos --> tp
  inclua biblioteca Util --> u

  inteiro totalProdutos = 100
  cadeia produtos[100][3] 

  funcao inicio() {
  
    para(inteiro a = 0; a < 100; a++){
      produtos[a][0] = " "
      para(inteiro b = 1; b < 3; b++) {
        produtos[a][b] = "0" 
      }
    }

    menu()
  }

   
  
    funcao menu() {
      inteiro opcao
      escreva("==================MENU==================\n\n")
      escreva("1 - Adicionar produto\n")
      escreva("2 - Atualizar produto\n")
      escreva("3 - Remover produto\n")
      escreva("4 - Pesquisar produto\n")
      escreva("5 - Exibir produtos em estoque\n")
      escreva("6 - Calcular valor total do estoque\n\n")
      escreva("Escolha uma opção: ")
      leia(opcao)

      escolha(opcao) {
        caso 1:
          limpa()
          adicionarProduto()
          pare
        caso 2:
          limpa()
          atualizarProduto()
          pare
        caso 3: 
          limpa()
          removerProduto()
          pare
        caso 4:
          limpa()
          pesquisarProduto()
          pare
        caso 5:
          limpa()
          exibirProdutosEstoque()
          pare
        caso 6: 
          limpa()
          calcularValorTotalEstoque()
          pare
        caso contrario:
          escreva("\nEscolha uma opcão válida!")
          u.aguarde(3000)
          limpa()
          menu()
          pare      
      }
    }

    funcao adicionarProduto() {
      cadeia nomeProduto
      inteiro contaEstoque = 0


      //verifica se o estoque está cheio. Caso esteja, retorna ao menu inicial
      para(inteiro c=0 ; c<totalProdutos ; c++) {
        se(produtos[c][0] != " ") {
          contaEstoque++
        }

        se (contaEstoque == 100) {
          escreva("O estoque está cheio. Não é possí­vel adicionar mais produtos!")
          u.aguarde(3000)
          limpa()
          menu()
        }
      }

      //recebe o nome do produto
      escreva("============== ADICIONAR PRODUTO=============\n\n")
      escreva("Digite o nome do produto: ")
      leia(nomeProduto)

      //verifica se o produto já está cadastrado no estoque. Caso já esteja, solicita um novo nome.
      para(inteiro d=0;d < totalProdutos; d++) {
        se (produtos[d][0] == nomeProduto) { 
          escreva("\n================ AVISO ================\n")
          escreva("Este produto já existe no estoque!")
          u.aguarde(3000)
          limpa()
          menu()
        }

        se (produtos[d][0] != " ") {
          d++
        } senao {
          produtos[d][0] = nomeProduto
          cadeia quantidade
          escreva("Digite a quantidade: ")
          leia(quantidade)
          produtos[d][1] = quantidade
          cadeia valorUnitario
          escreva("Digite o valor unitário: ")
          leia(valorUnitario)
          produtos[d][2] = valorUnitario
          escreva("\nProduto adicionado ao estoque.")
          u.aguarde(3000)
          limpa()
          menu()
        }
      }
    } 
  
    funcao atualizarProduto() {
      cadeia nomeProduto
        
      escreva("============== ATUALIZAR PRODUTO =============\n\n")
      escreva("Digite o nome do produto a ser atualizado: ")
      leia(nomeProduto)

      para (inteiro f = 0 ; f < totalProdutos; f++) {
        se (produtos[f][0] == nomeProduto) {
          cadeia quantidade
          escreva("\nProduto encontrado.")
          escreva("\nDigite a nova quantidade do produto: ")
          leia(quantidade)
          cadeia valorUnitario
          escreva("\nDigite o novo valor unitário:  ")
          leia(valorUnitario)
          produtos[f][1] = quantidade
          produtos[f][2] = valorUnitario
          escreva("\nPRODUTO ATUALIZADO COM SUCESSO!")
          u.aguarde(3000)
          limpa()
          menu()
        } senao {
          escreva("\nPRODUTO NÃO ENCONTRADO NO ESTOQUE.")
          u.aguarde(3000)
          limpa()
          menu()
        }
      }
    }

    funcao removerProduto() {
      cadeia nomeProduto
    
      escreva("============== REMOVER PRODUTO =============\n")
      escreva("Digite o nome do produto a ser removido: ")
      leia(nomeProduto)

      inteiro contador = 0
      inteiro posicaoAlteracao

      para(inteiro i = 0 ; i < 100; i++) {
        se(produtos[i][0] == nomeProduto) {
          posicaoAlteracao = i
        } senao {
          contador++
        }
      }

      se(contador == 100) {
         escreva("Produto selecionado não existe.")
         u.aguarde(3000)
         limpa()
         menu()
      } senao {
        produtos[posicaoAlteracao][0] = " "
        produtos[posicaoAlteracao][1] = "0"
        produtos[posicaoAlteracao][2] = "0"
        escreva("\nProduto removido com sucesso.")
        u.aguarde(3000)
        limpa()
        menu()
      }        
    }


    funcao pesquisarProduto() {
      escreva("============= PESQUISAR PRODUTO =============\n\n")    
      escreva("Digite o nome do produto a ser pesquisado: ")
      cadeia nomeProduto
      leia(nomeProduto)

      para(inteiro i = 0; i < 100; i++) {
        se(produtos[i][0] == nomeProduto) {
          escreva("\nDADOS DO PRODUTO\n")
          escreva("Nome do produto: ", produtos[i][0], "\n")
          escreva("Quantidade do produto: ", produtos[i][1], "\n")
          escreva("Valor do produto: R$ ", produtos[i][2], "\n")
          u.aguarde(3000)
          limpa()
          menu()
        } senao {
          escreva("\nProduto selecionado não existe.")
          u.aguarde(3000)
          limpa()
          menu()
        }
      }
    }

    funcao exibirProdutosEstoque() {
      inteiro contador = 0
      para(inteiro g = 0; g < 100; g++) {
        se(produtos[g][0] != " ") {
          contador++
        }
      }

      se(contador == 0) {
        escreva("O ESTOQUE ESTÁ VAZIO. NÃO HÁ RESULTADOS A SEREM EXIBIDOS.")
        u.aguarde(3000)
        limpa()
        menu()
      } senao {
        para(inteiro h = 0; h < 100; h++){
          se(produtos[h][0] != " "){
            escreva("Nome: ", produtos[h][0], "\n")
            escreva("Quantidade: ", produtos[h][1], " unidade(s)\n")
            escreva("Valor unitário: R$ ", produtos[h][2])
            escreva("\n\n==========\n\n")
          }
        }
      }
      u.aguarde(3000)
      limpa()
      menu()
    }

    funcao calcularValorTotalEstoque() {
      real soma = 0
      para(inteiro i = 0; i < 100; i++) {
        real quantidade = tp.cadeia_para_real(produtos[i][1])
        real valor = tp.cadeia_para_real(produtos[i][2])
        real resultado = quantidade * valor
        soma = soma + resultado
      }
      escreva("O valor total do estoque é: R$ ", soma)
      u.aguarde(3000)
      limpa()
      menu()
    }    
  }
}
  




