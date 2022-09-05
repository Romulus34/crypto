// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.0 <0.9.0;

abstract contract Market {

  address payable public acheteur;

  address payable public vendeur;

  uint public balances;

  uint public initialState;

  constructor() {
    vendeur = payable(msg.sender);
    initialState = uint(MarketObjectEnum.ProduitsDisponibles);
  }

  event ListProduit();

  event ProduitsAchetes(address buyer, uint price);

  event NotEnoughFunds(uint amount, uint price);

  enum MarketObjectEnum {
    ProduitsDisponibles,
    ArticlesCommandes
  }

  function achat(address _acheteur, address _vendeur, uint price) public {
    balances = _acheteur.balance;
    uint vendeur_balance = _vendeur.balance;

    if (balances >= price)
      balances -= price;
      vendeur_balance += price;

      emit ProduitsAchetes(msg.sender, price);

      // ...
  }

  function getBalances() public view returns (uint) {
    return balances;
  }
}
