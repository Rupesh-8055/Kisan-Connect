using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace UserLoginService.Models
{
    public partial class kisan_connectContext : DbContext
    {
        public kisan_connectContext()
        {

        }

        public kisan_connectContext(DbContextOptions<kisan_connectContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Buyer> Buyers { get; set; } = null!;
        public virtual DbSet<Cart> Carts { get; set; } = null!;
        public virtual DbSet<Farmer> Farmers { get; set; } = null!;
        public virtual DbSet<FarmerProduct> FarmerProducts { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<Payment> Payments { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<Variety> Varieties { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySql("server=localhost;port=3306;user=root;password=atharv1415;database=kisan_connect", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.2.0-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("utf8mb4_0900_ai_ci")
                .HasCharSet("utf8mb4");

            modelBuilder.Entity<Buyer>(entity =>
            {
                entity.HasKey(e => e.Bid)
                    .HasName("PRIMARY");

                entity.ToTable("buyer");

                entity.HasIndex(e => e.Uid, "uid");

                entity.Property(e => e.Bid).HasColumnName("bid");

                entity.Property(e => e.Address)
                    .HasMaxLength(30)
                    .HasColumnName("address");

                entity.Property(e => e.Contact)
                    .HasMaxLength(20)
                    .HasColumnName("contact");

                entity.Property(e => e.Email)
                    .HasMaxLength(30)
                    .HasColumnName("email");

                entity.Property(e => e.Fname)
                    .HasMaxLength(15)
                    .HasColumnName("fname");

                entity.Property(e => e.Lname)
                    .HasMaxLength(15)
                    .HasColumnName("lname");

                entity.Property(e => e.Uid).HasColumnName("uid");

                entity.HasOne(d => d.user)
                    .WithMany(p => p.Buyers)
                    .HasForeignKey(d => d.Uid)
                    .HasConstraintName("buyer_ibfk_1");
            });

            modelBuilder.Entity<Cart>(entity =>
            {
                entity.ToTable("cart");

                entity.HasIndex(e => e.Fpid, "fpid");

                entity.Property(e => e.CartId).HasColumnName("cart_id");

                entity.Property(e => e.Bid).HasColumnName("bid");

                entity.Property(e => e.Fpid).HasColumnName("fpid");

                entity.Property(e => e.Qty).HasColumnName("qty");

                entity.HasOne(d => d.Fp)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.Fpid)
                    .HasConstraintName("cart_ibfk_1");
            });

            modelBuilder.Entity<Farmer>(entity =>
            {
                entity.HasKey(e => e.Sid)
                    .HasName("PRIMARY");

                entity.ToTable("farmer");

                entity.HasIndex(e => e.Uid, "uid");

                entity.Property(e => e.Sid).HasColumnName("sid");

                entity.Property(e => e.Contact)
                    .HasMaxLength(20)
                    .HasColumnName("contact");

                entity.Property(e => e.Email)
                    .HasMaxLength(30)
                    .HasColumnName("email");

                entity.Property(e => e.Fname)
                    .HasMaxLength(15)
                    .HasColumnName("fname");

                entity.Property(e => e.Lname)
                    .HasMaxLength(15)
                    .HasColumnName("lname");

                entity.Property(e => e.RegNo)
                    .HasMaxLength(30)
                    .HasColumnName("reg_no");

                entity.Property(e => e.Uid).HasColumnName("uid");

                entity.HasOne(d => d.user)
                    .WithMany(p => p.Farmers)
                    .HasForeignKey(d => d.Uid)
                    .HasConstraintName("farmer_ibfk_1");
            });

            modelBuilder.Entity<FarmerProduct>(entity =>
            {
                entity.HasKey(e => e.Fpid)
                    .HasName("PRIMARY");

                entity.ToTable("farmer_product");

                entity.HasIndex(e => e.Pid, "pid");

                entity.HasIndex(e => e.Sid, "sid");

                entity.Property(e => e.Fpid).HasColumnName("fpid");

                entity.Property(e => e.Pid).HasColumnName("pid");

                entity.Property(e => e.Price)
                    .HasPrecision(10, 2)
                    .HasColumnName("price");

                entity.Property(e => e.Sid).HasColumnName("sid");

                entity.Property(e => e.Stock).HasColumnName("stock");

                entity.Property(e => e.Vid).HasColumnName("vid");

                entity.HasOne(d => d.PidNavigation)
                    .WithMany(p => p.FarmerProducts)
                    .HasForeignKey(d => d.Pid)
                    .HasConstraintName("farmer_product_ibfk_2");

                entity.HasOne(d => d.SidNavigation)
                    .WithMany(p => p.FarmerProducts)
                    .HasForeignKey(d => d.Sid)
                    .HasConstraintName("farmer_product_ibfk_1");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.HasKey(e => e.Oid)
                    .HasName("PRIMARY");

                entity.ToTable("order");

                entity.HasIndex(e => e.Bid, "bid");

                entity.HasIndex(e => e.Fpid, "fpid");

                entity.Property(e => e.Oid).HasColumnName("oid");

                entity.Property(e => e.Bid).HasColumnName("bid");

                entity.Property(e => e.Date).HasColumnName("date");

                entity.Property(e => e.Fpid).HasColumnName("fpid");

                entity.Property(e => e.TotAmt)
                    .HasPrecision(10, 2)
                    .HasColumnName("tot_amt");

                entity.HasOne(d => d.BidNavigation)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Bid)
                    .HasConstraintName("order_ibfk_2");

                entity.HasOne(d => d.Fp)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Fpid)
                    .HasConstraintName("order_ibfk_1");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.ToTable("order_details");

                entity.HasIndex(e => e.Oid, "oid");

                entity.HasIndex(e => e.Pid, "pid");

                entity.Property(e => e.OrderdetailId).HasColumnName("orderdetail_id");

                entity.Property(e => e.Oid).HasColumnName("oid");

                entity.Property(e => e.Pid).HasColumnName("pid");

                entity.Property(e => e.Qty).HasColumnName("qty");

                entity.Property(e => e.Rate)
                    .HasPrecision(10, 2)
                    .HasColumnName("rate");

                entity.HasOne(d => d.OidNavigation)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.Oid)
                    .HasConstraintName("order_details_ibfk_2");

                entity.HasOne(d => d.PidNavigation)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.Pid)
                    .HasConstraintName("order_details_ibfk_1");
            });

            modelBuilder.Entity<Payment>(entity =>
            {
                entity.HasKey(e => e.PayId)
                    .HasName("PRIMARY");

                entity.ToTable("payment");

                entity.HasIndex(e => e.Bid, "bid");

                entity.HasIndex(e => e.Oid, "oid");

                entity.Property(e => e.PayId).HasColumnName("pay_id");

                entity.Property(e => e.Amount)
                    .HasPrecision(10, 2)
                    .HasColumnName("amount");

                entity.Property(e => e.Bid).HasColumnName("bid");

                entity.Property(e => e.Oid).HasColumnName("oid");

                entity.Property(e => e.PayMethod)
                    .HasMaxLength(20)
                    .HasColumnName("pay_method");

                entity.Property(e => e.TransNo)
                    .HasMaxLength(30)
                    .HasColumnName("trans_no");

                entity.HasOne(d => d.BidNavigation)
                    .WithMany(p => p.Payments)
                    .HasForeignKey(d => d.Bid)
                    .HasConstraintName("payment_ibfk_1");

                entity.HasOne(d => d.OidNavigation)
                    .WithMany(p => p.Payments)
                    .HasForeignKey(d => d.Oid)
                    .HasConstraintName("payment_ibfk_2");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.Pid)
                    .HasName("PRIMARY");

                entity.ToTable("product");

                entity.Property(e => e.Pid).HasColumnName("pid");

                entity.Property(e => e.Pname)
                    .HasMaxLength(30)
                    .HasColumnName("pname");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.Rid)
                    .HasName("PRIMARY");

                entity.ToTable("role");

                entity.Property(e => e.Rid)
                    .ValueGeneratedNever()
                    .HasColumnName("rid");

                entity.Property(e => e.Rname)
                    .HasMaxLength(15)
                    .HasColumnName("rname");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Uid)
                    .HasName("PRIMARY");

                entity.ToTable("user");

                entity.HasIndex(e => e.Rid, "rid");

                entity.Property(e => e.Uid).HasColumnName("uid");

                entity.Property(e => e.Email)
                    .HasMaxLength(30)
                    .HasColumnName("email");

                entity.Property(e => e.Password)
                    .HasMaxLength(200)
                    .HasColumnName("password");

                entity.Property(e => e.Rid).HasColumnName("rid");

                entity.Property(e => e.Uname)
                    .HasMaxLength(30)
                    .HasColumnName("uname");

                entity.HasOne(d => d.RidNavigation)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.Rid)
                    .HasConstraintName("user_ibfk_1");
            });

            modelBuilder.Entity<Variety>(entity =>
            {
                entity.HasKey(e => e.Vid)
                    .HasName("PRIMARY");

                entity.ToTable("variety");

                entity.HasIndex(e => e.Pid, "pid");

                entity.Property(e => e.Vid).HasColumnName("vid");

                entity.Property(e => e.Pid).HasColumnName("pid");

                entity.Property(e => e.Vname)
                    .HasMaxLength(30)
                    .HasColumnName("vname");

                entity.HasOne(d => d.PidNavigation)
                    .WithMany(p => p.Varieties)
                    .HasForeignKey(d => d.Pid)
                    .HasConstraintName("variety_ibfk_1");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
