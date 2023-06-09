
  getProduct (getOneProductById , context , id , ) async {

    try {
      await getOneProductById(context , id);
    } catch (e) {
      return e;
    }
  }