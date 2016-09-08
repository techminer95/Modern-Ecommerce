package com.nitsoft.ecommerce.api.category;

import com.nitsoft.ecommerce.api.APIName;
import com.nitsoft.ecommerce.api.APIUtil;
import com.nitsoft.ecommerce.api.response.StatusResponse;
import com.nitsoft.ecommerce.dao.ProductAtrributeDetaiImpl;
import com.nitsoft.ecommerce.dao.ProductImpl;
import com.nitsoft.ecommerce.model.Product;
import com.nitsoft.util.Constant;
import com.nitsoft.util.ValueConverter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductAPI extends APIUtil {

    @Autowired
    private ProductImpl productsImpl;
    @Autowired
    private ProductAtrributeDetaiImpl productAtrributeDetaiImpl;

    @RequestMapping(value = APIName.PRODUCTS, method = RequestMethod.GET, produces = APIName.CHARSET)
    public String getAllProducts() {
        List<Product> products = productsImpl.findAll(Product.class);
        List<Object> results = new LinkedList<>();

        for (Product product : products) {
            List productDetais = productAtrributeDetaiImpl.findByProductId(product.getProductId());

            Map<String, Object> mapObj = new HashMap<>();
            mapObj.put("product", product);
            mapObj.put("attributes", productDetais);

            results.add(mapObj);
        }

        return writeObjectToJson(new StatusResponse(200, results));
    }

    @RequestMapping(value = APIName.PRODUCTS_BY_CATEGORY, method = RequestMethod.GET, produces = APIName.CHARSET)
    public String getProductByCategoryId(@RequestParam int categoryId) {

        List<Product> products = productsImpl.findAllByCategoryId(categoryId);

        return writeObjectToJson(new StatusResponse(200, products));
    }

    @RequestMapping(value = APIName.PRODUCTS_FILTER_LIST, method = RequestMethod.GET, produces = APIName.CHARSET)
    public String getProductFilterList(
            @RequestParam String companyId,
            @RequestParam(required = false) String categoryId,
            @RequestParam(required = false) String attributeId,
            @RequestParam(required = false) String searchKey,
            @RequestParam(required = false) String minPrice,
            @RequestParam(required = false) String maxPrice,
            @RequestParam(required = false) String sortCase,
            @RequestParam(required = false) String ascSort,
            @RequestParam(required = false) String pageSize,
            @RequestParam(required = false) String pageNumber
    ) {

        int comId = ValueConverter.convertStringToInt(companyId, -1);
        int catId = ValueConverter.convertStringToInt(categoryId, -1);
        int attrId = ValueConverter.convertStringToInt(attributeId, -1);
        double mnPrice = ValueConverter.convertStringToDouble(minPrice, -1);
        double mxPrice = ValueConverter.convertStringToDouble(maxPrice, -1);
        int sortKey = ValueConverter.convertStringToInt(sortCase, -1);
        boolean isAscSort = ValueConverter.convertStringToBoolean(ascSort, true);
        int pSize = ValueConverter.convertStringToInt(pageSize, Constant.DEFAULT_PAGE_SIZE);
        int pNumber = ValueConverter.convertStringToInt(pageNumber, Constant.DEFAULT_PAGE_NUMBER);

        List<Product> products = productsImpl.doFilterSearchSortPagingProduct(comId, catId, attrId, searchKey, mnPrice, mxPrice, sortKey, isAscSort, pSize, pNumber);

        return writeObjectToJson(new StatusResponse(200, products));
    }
}
