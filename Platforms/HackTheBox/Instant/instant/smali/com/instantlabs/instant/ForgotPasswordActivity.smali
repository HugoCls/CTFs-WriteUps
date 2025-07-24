.class public Lcom/instantlabs/instant/ForgotPasswordActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ForgotPasswordActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 14
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 15
    sget p1, Lcom/instantlabs/instant/R$layout;->activity_forgot_password:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/ForgotPasswordActivity;->setContentView(I)V

    .line 17
    sget p1, Lcom/instantlabs/instant/R$id;->back_button:I

    invoke-virtual {p0, p1}, Lcom/instantlabs/instant/ForgotPasswordActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 18
    new-instance v0, Lcom/instantlabs/instant/ForgotPasswordActivity$1;

    invoke-direct {v0, p0}, Lcom/instantlabs/instant/ForgotPasswordActivity$1;-><init>(Lcom/instantlabs/instant/ForgotPasswordActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
