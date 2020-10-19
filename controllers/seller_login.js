const db = require("../database/database");
const uniqId = require("uniqid");
const bycrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
//Number Check of Seller
exports.sellerNumberCheck = async (req, res, next) => {
  const phoneNumber = req.body.phoneNumber;
  try {
    let sql = `SELECT username FROM sellerlogin WHERE phone=${phoneNumber}`;
    db.query(sql, (err, result) => {
      if (err) {
        const err = new Error("failed to add in database");
        throw err;
      }
      if (result.length != 0) {
        res.status(200).json({ isRegistered: true });
      } else {
        res.status(200).json({ isRegistered: false });
      }
    });
  } catch (err) {}
};

exports.signUp = async (req, res, next) => {
  const phoneNumber = req.body.phoneNumber;
  const username = req.body.username;
  const password = req.body.password;
  const shopId = uniqId();

  let sql = `INSERT INTO sellerlogin (username,password,phone,shopId) VALUES ('${username}',${password},${phoneNumber},'${shopId}')`;
  let token = jwt.sign(
    { username: username, password: password, phoneNumber: phoneNumber },
    "somesupersecretsecret",
    { expiresIn: "100h" }
  );

  db.query(sql, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res
        .status(200)
        .json({ message: "Data Added!!!!", token: token, user: result });
    }
  });
};

exports.login = async (req, res, next) => {
  const phoneNumber = req.body.phoneNumber;
  const password = req.body.password;
  let sql = `SELECT username FROM sellerlogin where password=${password} AND phone=${phoneNumber} `;

  db.query(sql, (err, result) => {
    if (err) {
      console.log(err);
    } else {
      if (result.length != 0) {
          console.log(result)
        let token = jwt.sign(
          { username: result[0], password: password, phoneNumber: phoneNumber },
          "somesupersecretsecret",
          { expiresIn: "100h" }
        );
        res.status(200).json({
          user: result[0],
          message: "Authenticated",
          token: token,
        });
      } else {
        res.json({
          message: "Not Autherised",
        });
      }
    }
  });
};
