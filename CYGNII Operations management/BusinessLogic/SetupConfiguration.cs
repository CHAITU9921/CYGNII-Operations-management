/// Created Date : 25- April- 2023*/
/// Created By : Supriya choudhary
/// Modified By :
/// Ver 1.1
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace CYGNII_Operations_management.BusinessLogic
{
    public class SetupConfiguration
    {
        #region To Show all Application Settings
        static void ShowConfig()
        {

            // For read access you do not need to call OpenExeConfiguraton

            foreach (string key in ConfigurationSettings.AppSettings)
            {
                string value = ConfigurationSettings.AppSettings[key];
                Console.WriteLine("Key: {0}, Value: {1}", key, value);
            }
        }
        #endregion

        #region Open file in to a filestream and read data in a byte array.
        public byte[] ReadFile(string sPath)
        {
            //Initialize byte array with a null value initially.
            byte[] data = null;

            //Use FileInfo object to get file size.
            FileInfo fInfo = new FileInfo(sPath);
            long numBytes = fInfo.Length;

            //Open FileStream to read file
            FileStream fStream = new FileStream(sPath, FileMode.Open, FileAccess.Read);

            //Use BinaryReader to read file stream into byte array.
            BinaryReader br = new BinaryReader(fStream);

            //When you use BinaryReader, you need to supply number of bytes to read from file.
            //In this case we want to read entire file. So supplying total number of bytes.
            data = br.ReadBytes((int)numBytes);
            return data;
        }
        #endregion

        #region Encryption Function

        public static string Encrypt(
                                     string plainText,
                                     string passPhrase,
                                     string saltValue,
                                     string hashAlgorithm,
                                     int passwordIterations,
                                     string initVector,
                                     int keySize
                                     )
        {

            byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
            byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);


            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);


            PasswordDeriveBytes password = new PasswordDeriveBytes(
                passPhrase,
                saltValueBytes,
                hashAlgorithm,
                passwordIterations);


            byte[] keyBytes = password.GetBytes(keySize / 8);


            RijndaelManaged symmetricKey = new RijndaelManaged();


            symmetricKey.Mode = CipherMode.CBC;


            ICryptoTransform encryptor = symmetricKey.CreateEncryptor(
                keyBytes,
                initVectorBytes);


            MemoryStream memoryStream = new MemoryStream();


            CryptoStream cryptoStream = new CryptoStream(memoryStream,
                                                         encryptor,
                                                         CryptoStreamMode.Write);
            // Start .
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);

            // Finish .
            cryptoStream.FlushFinalBlock();

            // Convert our encrypted data from a memory stream into a byte array.
            byte[] cipherTextBytes = memoryStream.ToArray();

            // Close both streams.
            memoryStream.Close();
            cryptoStream.Close();

            // Convert encrypted data into a base64-encoded string.
            string cipherText = Convert.ToBase64String(cipherTextBytes);

            // Return encrypted string.
            return cipherText;
        }
        #endregion

        #region Decryption Function

        public static string Decrypt(String cipherText,
                                     string passPhrase,
                                     string saltValue,
                                     string hashAlgorithm,
                                     int passwordIterations,
                                     string initVector,
                                     int keySize)
        {

            byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
            byte[] saltValueBytes = Encoding.ASCII.GetBytes(saltValue);

            // Convert our ciphertext into a byte array.
            byte[] cipherTextBytes = Convert.FromBase64String(cipherText);


            PasswordDeriveBytes password = new PasswordDeriveBytes(
                passPhrase,
                saltValueBytes,
                hashAlgorithm,
                passwordIterations);


            byte[] keyBytes = password.GetBytes(keySize / 8);

            // Create uninitialized Rijndael encryption object.
            RijndaelManaged symmetricKey = new RijndaelManaged();


            symmetricKey.Mode = CipherMode.CBC;

            ICryptoTransform decryptor = symmetricKey.CreateDecryptor(
                keyBytes,
                initVectorBytes);

            // Define memory stream which will be used to hold encrypted data.
            MemoryStream memoryStream = new MemoryStream(cipherTextBytes);

            // Define cryptographic stream (always use Read mode for encryption).
            CryptoStream cryptoStream = new CryptoStream(memoryStream,
                                                          decryptor,
                                                          CryptoStreamMode.Read);


            byte[] plainTextBytes = new byte[cipherTextBytes.Length];

            // Start decrypting.
            int decryptedByteCount = cryptoStream.Read(plainTextBytes,
                                                       0,
                                                       plainTextBytes.Length);

            // Close both streams.
            memoryStream.Close();
            cryptoStream.Close();


            string plainText = Encoding.UTF8.GetString(plainTextBytes,
                                                       0,
                                                       decryptedByteCount);

            // Return decrypted string.
            return plainText;
        }
        #endregion
    }
}


