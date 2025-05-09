<tbody>
                    <?php
                    include "koneksi.php";
                    $no = 1;
                    // Cek apakah ada pencarian
                    $query = isset($_POST['query']) ?
                    mysqli_real_escape_string($koneksi, $_POST['query']) : '';

                    // Query Dasar
                    $sql_query = "SELECT id_kategori, nm_kategori FROM tb_kategori";

                    // Jika ada pencarian, tambahkan kondisi WHERE
                    if (!empty($query)) {
                        $sql_query .= " WHERE nm_kategori LIKE '%$query%'";
                    }
                    $sql_query= mysqli_query($koneksi, $sql_query);
                    if ($sql_query) 
                      if (mysqli_num_rows($sql) > 0) {
                        while ($hasil = mysqli_fetch_array($sql)) {
                      ?>
                        <td><?php echo $no++; ?></td>
                        <td><?php echo $hasil
                        ['nama_kategori']; ?></td>
                        <td>
                          <a href="e_kategori.php?id_kategori=<?
                          php echo $hasil
                          ['id_kategori']; ?>"
                          class="btn btn-warning">
                            <i class="bi
                             bi-pencil-square"></i>
                          </a>                       
                          <a href="h_kategori.php?id_kategori=<?
                          php echo $hasil
                          ['id_kategori']; ?>"
                          class="btn btn-danger"
                          onclick="return confirm('Apakah Anda yakin ingin menghapus data ini?')">
                            <i class="bi bi-trash"></i>
                          </a>
                        </td>  
                      </tr>
                      <?php
                      }
                   } else {
                      ?>
                      <tr>
                        <td colspan="3" class="text-center">Tidak ada data</td>
                      </tr>
                      <?php
                      }
                      ?>
                    </tbody>