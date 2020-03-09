### Scaffold: 
    Cria um container de uma forma segura, esqueleto da página
- AppBar: Barra app, no menu superior
- body: Corpo do Scaffold
-- -
### Column: 
- Pode ter muitos filhos(**children**)
- **mainAisAlignment**(.) MainAxisAlignment: 

    Criar espaços entre os itens, etc, como: 
    - [...][.]spaceBetween  -> Cria espaço entre os itens
    - [...][.]spaceAround   -> Espaço entre os itens
    - [...][.]spaceEvenly   -> Espaço entre os itens com alinhamentos
    - [...][.]start         -> Coloca os itens alinhados no começo
    - [...][.]end           -> Alinha os itens no fim
    - [...][.]center        -> Alinha os itens no centro

- **crossAxisAlignment**(.) CrossAxisAlignment: Controla o alinhamento do item dentro da coluna, como: center, start, end

-- -
### Row

Cria itens na mesma linha, tambem conta com o cross e main alignment, porém eles são de maneira inversa, o cross arruma na linha e o main na posição, lugar da linha.
-- -
### List View

Listas Horizontais e verticais
