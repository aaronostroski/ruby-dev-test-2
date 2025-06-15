# Refactoring de relacionamento

> A Madonna resolveu lançar um album em parceria com a Shakira! E agora?!

Nosso PO jamais iria esperar que um album pudesse ter mais de um artista. Transforme a relacão 1 para N entre Player e Album em uma relação N para N. Precisamos de testes senão o chato do agilista vai brigar conosco!

---------- RESOLUÇÃO ------------

### Descrição

Problema: O relacionamento entre Albums e Players foi modificado de 1:N para N:N. Agora, um Album pode ter vários Players e, da mesma forma, um Player pode estar vinculado a vários Albums.

Solução: Os modelos foram ajustados para suportar o novo relacionamento. Os testes existentes foram atualizados para refletir a nova lógica, e novos testes foram adicionados para validar os novos cenários. Além disso, o uso das fixtures foi aprimorado para facilitar a leitura dos testes e a revisão do código. Também foi realizada uma migração dos dados existentes para garantir a consistência com a nova estrutura.

### Links e observações

As versões e bibliotecas (gems) foram mantidas, exceto pelo mimemagic, que não possuía mais suporte para a versão previamente utilizada.

### Checklist para poder mergear

- [ ] Alteração nas relacionamento
- [ ] Dados corretamente migrados
- [ ] Validação de cenários de testes e cobertura.
